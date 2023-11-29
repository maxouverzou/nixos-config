{ pkgs
, inputs
, ...
}:
let
  hyprland = inputs.hyprland;
  mpvpaperSocket = "~/.mpv.sock";
in
{
  imports =
    [
      hyprland.homeManagerModules.default
      ./wlr-environment.user
    ];

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
    hyprshot
  ];

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

      $mod = SUPER

      binde=, XF86AudioRaiseVolume, exec, xf86-audio-raise-volume
      binde=, XF86AudioLowerVolume, exec, xf86-audio-lower-volume
      bind=, XF86AudioMute, exec, xf86-audio-mute
      bind=, XF86AudioMicMute, exec, xf86-audio-mic-mute

      binde=, XF86MonBrightnessDown, exec, xf86-mon-brightness-down
      binde=, XF86MonBrightnessUp, exec, xf86-mon-brightness-up

      # XF86Display
      # XF86WLAN # Works out w/o configuration on thinkpad 11e
      # XF86Tools
      # XF86Search
      # XF86LaunchA
      # XF86Explorer

      bind = $mod, Q, exec, [float;noanim] wlogout
      bind = $mod SHIFT, Q, exit
      bind = $mod, W, killactive
      bind = $mod, R, exec, hyprctl reload

      bind = $mod, T, exec, swaync-client --toggle-panel

      bind = $mod, Return, exec, kitty fish
      bind = $mod SHIFT, Return, exec, kitty fish --no-config

      bind = $mod, D, exec, rofi -show drun
      bind = $mod SHIFT, D, exec, rofi -show run

      bind = CTRL SHIFT, 3, exec, hyprshot -m output
      bind = CTRL SHIFT, 4, exec, hyprshot -m region

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mod, mouse_down, workspace, e+1
      bind = $mod, mouse_up, workspace, e-1

      bind = $mod SHIFT, SPACE, togglefloating
      bind = $mod, O, movewindow, mon:+1

      # master shortcuts

      bind = $mod CTRL, Return, layoutmsg, swapwithmaster

      bind = $mod, SPACE, layoutmsg, orientationnext

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

        monitor=,highres,auto,1

        # env = GDK_SCALE,2
        # env = XCURSOR_SIZE,32
    '';
  };
}
