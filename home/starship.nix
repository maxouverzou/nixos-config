{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      status = {
        disabled = false;
      };
      username = {
        style_user = "blue bold";
        style_root = "red bold";
        format = "[$user]($style) ";
        disabled = false;
        show_always = false;
      };
      hostname = {
        ssh_only = true;
        # ssh_symbol = "🌐 ";
        # format = "on [$hostname](bold red) ";
        trim_at = ".local";
        disabled = false;
      };
    };
  };
}
