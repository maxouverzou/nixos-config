{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports =
    [
      ../../components/nix.user.nix
    ];


    home.packages = with pkgs; [
      httpie
      azure-cli
      terraform
      powershell
    ];

    programs = {
      fish = {
        enable = true;
      };
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
