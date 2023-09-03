{ config, pkgs, lib, ... }:

let
  inherit (lib) mkDefault;
in
rec {
  imports =
    [
      <home-manager/nixos>
    ];

  users.extraUsers.milou = {
    isNormalUser = true;
    # TODO: optional if docker.enable ++ docker
    extraGroups = mkDefault [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "docker"
      "libvirtd"
      "plugdev"
      "adbusers"
    ];
  };

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  home-manager.users.milou = { pkgs, ... }: {
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
  };
}
