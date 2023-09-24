{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nix-du
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];

      trusted-users = [
        "root"
        "@wheel"
      ];

      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  
  nixpkgs.overlays = import ../packages/overlays;
}
