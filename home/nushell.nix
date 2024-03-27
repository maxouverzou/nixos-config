{
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config.show_banner = false
    '';
  };

  programs.direnv.enableNushellIntegration = true;
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
  };
}
