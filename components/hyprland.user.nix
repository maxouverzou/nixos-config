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
    ranger
    xdg-utils # clickable urls w/ kitty
    brightnessctl

    rofi-wayland
    rofi-bluetooth
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        #output = [
        #  "eDP-1"
        #  "HDMI-A-1"
        #];
        modules-left = [ "hyprland/workspaces" "wlr/workspaces" "hyprland/submap" "custom/media" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "idle_inhibitor" "pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "keyboard-state" "hyprland/language" "battery" "battery#bat2" "clock" "tray" ];
        "hyprland/workspaces" = {
          # disable-scroll = true;
          all-outputs = true;
        };
        "wlr/workspaces" = {
          all-outputs = true;
        };
      };
    };
  };

  programs.kitty = {
    enable = true;
    theme = "Solarized Dark";
    extraConfig = ''
      enable_audio_bell yes
    '';
  };

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

  services.avizo = {
    enable = true;
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
      general {
        layout = master
      }

      master {
        new_is_master = false
        mfact = 0.5
      }

      misc {
        disable_hyprland_logo = true
      }

      exec-once = ${pkgs.mako}/bin/mako
      # exec-once = ${pkgs.waybar}/bin/waybar
      exec-once = ${pkgs.mpvpaper}/bin/mpvpaper --mpv-options "no-audio loop-playlist shuffle panscan=1 input-ipc-server=${mpvpaperSocket}" '*' ~/Development/playground/python/apple-tv-screensavers/files/

      $mod = SUPER

      binde=, XF86AudioRaiseVolume, exec, volumectl +5% # wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
      binde=, XF86AudioLowerVolume, exec, volumectl -5% # wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bind=, XF86AudioMute, exec, volumectl toggle-mute # wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bind=, XF86AudioMicMute, exec, volumectl -m toggle-mute # wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

      binde=, XF86MonBrightnessDown, exec, lightctl -5% # ${pkgs.brightnessctl}/bin/brightnessctl set 5%-
      binde=, XF86MonBrightnessUp, exec, lightctl +5% # ${pkgs.brightnessctl}/bin/brightnessctl set +5%

      # XF86Display
      # XF86WLAN # Works out w/o configuration on thinkpad 11e
      # XF86Tools
      # XF86Search
      # XF86LaunchA
      # XF86Explorer

      bind = $mod, Q, exec, [float;noanim] wlogout
      bind = $mod SHIFT, Q, exit
      bind = $mod SHIFT, C, killactive
      bind = $mod, R, exec, hyprctl reload

      bind = $mod, Return, exec, ${pkgs.kitty}/bin/kitty fish
      bind = $mod SHIFT, Return, exec, ${pkgs.kitty}/bin/kitty fish --no-config

      bind = $mod, D, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun
      bind = $mod SHIFT, D, exec, ${pkgs.rofi-wayland}/bin/rofi -show run

      bind = CTRL SHIFT, 3, exec, ${pkgs.hyprshot}/bin/hyprshot -m output
      bind = CTRL SHIFT, 4, exec, ${pkgs.hyprshot}/bin/hyprshot -m region

      # bind = $mod, L, exec, ${pkgs.swaylock-effects}/bin/swaylock ${swaylockOptions}

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mod, mouse_down, workspace, e+1
      bind = $mod, mouse_up, workspace, e-1

      # master shortcuts

      bind = $mod CTRL, Return, layoutmsg, swapwithmaster

      bind = $mod, SPACE, layoutmsg, orientationnext
      bind = $mod SHIFT, SPACE, layoutmsg, orientationprev

      bind = $mod, H, splitratio, -0.05
      bind = $mod, L, splitratio, +0.05

      bind = $mod SHIFT, H, layoutmsg, addmaster
      bind = $mod SHIFT, L, layoutmsg, removemaster

      #bind = ALT, tab, workspace, m+1
      #bind = ALT SHIT, tab, workspace, m-1

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
