{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
    #home.packages = with pkgs; [ httpie ];

    programs = {
      bash = {
        enable = true;
        historyControl = [ "ignoredups" "ignorespace" ];
      };

      ssh = {
        enable = true;
        serverAliveInterval = 60;
      };

      git = {
        enable = true;
        extraConfig = {
          init = { defaultBranch = "main"; };
          push = { default = "current"; };
          pull = { rebase = true; };
          rebase = { autoStash = true; };
        };
        lfs.enable = true;
      };
    };

    home.stateVersion = "23.05";
}
