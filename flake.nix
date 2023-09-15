{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    nurpkgs.url = "github:nix-community/NUR";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;

    forEachSystem = lib.genAttrs ["x86_64-linux" "aarch64-linux"];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

    pkgs = import nixpkgs {
      config = {
        allowUnfree = true;
      };
    };

    lib = nixpkgs.lib;

  in {

    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };

    devShells = forEachPkgs (pkgs: import ./shell.nix {inherit pkgs;});

    nixosConfigurations = {
      kiosk = lib.nixosSystem {
        specialArgs = {inherit inputs outputs; };

        modules = [
          ./machines/nuc-box-2-plus/default.nix
        ];
      };

      wheatley = lib.nixosSystem {
        specialArgs = {inherit inputs outputs; };
        
        modules = [
          ./machines/thinkpad-e11
        ];
      };
    };
  };
}
