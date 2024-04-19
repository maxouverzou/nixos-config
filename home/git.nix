{ pkgs, config, flake, ... }:
{
  home.packages = with pkgs; [ git-lfs vim ];

  programs.git = {
    package = pkgs.gitAndTools.gitFull;
    enable = true;
    userName = flake.config.people.users.${config.home.username}.name;
    userEmail = flake.config.people.users.${config.home.username}.email;
    aliases = {
      co = "checkout";
      ci = "commit";
      cia = "commit --amend";
      s = "status";
      st = "status";
      b = "branch";
      # p = "pull --rebase";
      pu = "push";
    };
    ignores = [ "*~" "*.swp" ];
    delta = {
      enable = true;
      options = {
        features = "decorations";
        navigate = true;
        light = false;
        side-by-side = true;
      };
    };
    extraConfig = {
      init.defaultBranch = "master";
      core.editor = "vim";
      #protocol.keybase.allow = "always";
      credential.helper = "store --file ~/.git-credentials";
      pull.rebase = "false";
      # For supercede
      core.symlinks = true;
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      # This looks better with the kitty theme.
      gui.theme = {
        lightTheme = false;
        activeBorderColor = [ "white" "bold" ];
        inactiveBorderColor = [ "white" ];
        selectedLineBgColor = [ "reverse" "white" ];
      };
    };
  };

  programs.gitui.enable = true;
}
