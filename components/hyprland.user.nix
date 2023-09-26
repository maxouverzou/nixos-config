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
    wl-clipboard
    wf-recorder
  ];

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
  };

  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "swaylock ${swaylockOptions}";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
  };

  home.file = {
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
    systemdTarget = "graphical-session.target";
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

  services.gammastep = {
    enable = true;
    provider = "geoclue2";
    latitude = 47;
    longitude = 122;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      exec-once = ${pkgs.mako}/bin/mako
      exec-once = ${pkgs.waybar}/bin/waybar
      exec-once = ${pkgs.mpvpaper}/bin/mpvpaper --mpv-options "no-audio loop-playlist shuffle panscan=1 input-ipc-server=${mpvpaperSocket}" '*' ~/Development/playground/python/apple-tv-screensavers/files/

      $mod = SUPER

      bind = $mod, Q, exec, wlogout
      bind = $mod SHIFT, Q, exit
      bind = $mod SHIFT, C, killactive
      bind = $mod, R, exec, hyprctl reload

      bind = $mod, Return, exec, ${pkgs.kitty}/bin/kitty fish
      bind = $mod SHIFT, Return, exec, ${pkgs.kitty}/bin/kitty fish --no-config

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
