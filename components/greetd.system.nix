{ pkgs, config, ... }: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time --user-menu --remember --remember-user-session \
          --cmd Hyprland \
          --sessions ${config.services.xserver.displayManager.sessionData.desktops}/share/wayland-sessions \
          '';
        # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --user-menu --remember --remember-user-session --sessions ${config.services.xserver.displayManager.sessionData.desktops}/share/wayland-sessions";
        user = "greeter";
      };
    };
  };
  # TODO: needed?
  environment.etc."greetd/environments".text = ''
    startplasma-wayland
  '';
}
