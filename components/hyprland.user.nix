{ pkgs
, inputs
, ...
}:
let
  hyprland = inputs.hyprland;
  swaylockOptions = "--fade-in 2 --screenshots --effect-pixelate 10 --effect-greyscale";
  mpvpaperSocket = "~/.mpv.sock";
in
{
  imports =
    [
      hyprland.homeManagerModules.default
    ];

  # /nix/store/ckimsqb0hsqsgsidp5avmdgrs9p4q0l9-home-manager-path/share/hyprland/hyprland.conf

  xdg = {
    enable = true;
    desktopEntries = {
      VSCodium = {
        name = "VSCodium (gpu disabled)";
        exec = "codium --disable-gpu";
      };
    };
  };

  home.packages = with pkgs; [
    rofi-network-manager
  ];

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  home.file = {
    ".config/rofi/rofi-network-manager.conf".text = ''
      # Location
      # +---------- +
      # | 1 | 2 | 3 |
      # | 8 | 0 | 4 |
      # | 7 | 6 | 5 |
      # +-----------+
      #The grid represents the screen with the numbers indicating the location of the window.
      #If you want the window to be in the upper right corner, set location to 3.
      LOCATION=0
      #This sets the anchor point for the window displaying the QR code.         
      QRCODE_LOCATION=$LOCATION 
      #X, Y Offset
      #This sets the distance of the window from the edge of the screen on the X and Y axis.
      Y_AXIS=0
      X_AXIS=0
      #Use notifications or not
      #Values can be "true" or "false"
      NOTIFICATIONS="false"
      #Location of qrcode wifi image
      QRCODE_DIR="/tmp/"
      #WIDTH_FIX_MAIN/WIDTH_FIX_STATUS 
      #These values can be adjusted if the text doesn't fit or
      #if there is too much space at the end when you launch the script.
      #It will depend on the font type and size.
      WIDTH_FIX_MAIN=1
      WIDTH_FIX_STATUS=10
      #Values can be "true" or "false"
      #Set it to true, if the script outputs the signal strength with asterisks
      #and you want  bars.
      ASCII_OUT=false
      #Values can be "true" or "false"
      #Set it to true if you want to use custom icons
      #for the signal strength instead of the default ones.
      CHANGE_BARS=false
      #Custom signal strength indicators
      SIGNAL_STRENGTH_0="0"
      SIGNAL_STRENGTH_1="1"
      SIGNAL_STRENGTH_2="12"
      SIGNAL_STRENGTH_3="123"
      SIGNAL_STRENGTH_4="1234"
    '';

    ".mpvpaper-cycle-pause.sh" = {
      text = ''
        #!/bin/sh
        echo "cycle pause" | ${pkgs.socat}/bin/socat - ${mpvpaperSocket}
      '';
      executable = true;
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "lock";
        command = "sh ~/.mpvpaper-cycle-pause.sh";
      }
      {
        event = "unlock";
        command = "sh ~/.mpvpaper-cycle-pause.sh";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock-effects}/bin/swaylock --grace 10 ${swaylockOptions}";
      }
    ];
  };


  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      exec-once = ${pkgs.mako}/bin/mako
      exec-once = ${pkgs.waybar}/bin/waybar
      exec-once = ${pkgs.mpvpaper}/bin/mpvpaper --mpv-options "no-audio loop-playlist shuffle panscan=1 input-ipc-server=${mpvpaperSocket}" '*' ~/Development/playground/python/apple-tv-screensavers/files/

      $mod = SUPER

      bind = $mod, Q, exit
      bind = $mod SHIFT, C, killactive
      bind = $mod, R, exec, hyprctl reload

      bind = $mod, Return, exec, ${pkgs.kitty}/bin/kitty fish
      bind = $mod SHIFT, Return, exec, ${pkgs.kitty}/bin/kitty bash

      bind = $mod, D, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun
      bind = $mod SHIFT, D, exec, ${pkgs.rofi-wayland}/bin/rofi -show run

      bind = CTRL SHIFT, 3, exec, ${pkgs.hyprshot}/bin/hyprshot -m output
      bind = CTRL SHIFT, 4, exec, ${pkgs.hyprshot}/bin/hyprshot -m region

      bind = $mod, L, exec, ${pkgs.swaylock-effects}/bin/swaylock ${swaylockOptions}

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mod, mouse_down, workspace, e+1
      bind = $mod, mouse_up, workspace, e-1

      #bind = ALT, tab, workspace, m+1
      #bind = ALT SHIT, tab, workspace, m-1

      bind = , Print, exec, grimblast copy area

      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      ${builtins.concatStringsSep "\n" (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in ''
            bind = $mod, ${ws}, workspace, ${toString (x + 1)}
            bind = $mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
          ''
        )
        10)}
    '';
  };
}
