{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";

    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nurpkgs.url = "github:nix-community/NUR";

    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nix-ld
    , nixos-generators
    , ...
    } @ inputs:
    let
      inherit (self) outputs;

      forEachSystem = lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

      pkgs = import nixpkgs {
        config = {
          allowUnfree = true;
        };
      };

      lib = nixpkgs.lib;

    in
    {

      nixpkgs = {
        config = {
          allowUnfree = true;
          allowUnfreePredicate = _: true;
        };
      };

      devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });

      nixosConfigurations = {
        kiosk = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };

          modules = [
            ./machines/nuc-box-2-plus/default.nix
            nix-ld.nixosModules.nix-ld
          ];
        };

        wheatley = lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };

          modules = [
            ./machines/thinkpad-e11
          ];
        };

      };

      packages.x86_64-linux = {
        rpi = nixos-generators.nixosGenerate {
          system = "aarch64-linux";
          modules = [
            ./machines/rpi3
          ];
          format = "sd-aarch64-installer";
        };
      };

    };
}
