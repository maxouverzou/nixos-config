{ config
, pkgs
, flake
, ...
}: {
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

  nixpkgs = {
    overlays = [
      # flake.inputs.jenkins-nix-ci.overlay
      flake.inputs.nur.overlay
      flake.inputs.nixd.overlays.default
    ] ++ (import ../packages/overlays);
    config = {
      allowUnfree = true;
    };
  };
}
