{
  description = "NixOS / nix-darwin configuration";

  inputs = {
    # Principle inputs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    # nix-darwin.url = "github:lnl7/nix-darwin";
    # nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixos-flake.url = "github:srid/nixos-flake";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # CI server
    sops-nix.url = "github:Mic92/sops-nix";

    # Software inputs
    nixos-shell.url = "github:Mic92/nixos-shell";
    nixos-vscode-server.flake = false;
    nixos-vscode-server.url = "github:nix-community/nixos-vscode-server";
    nixpkgs-match.url = "github:srid/nixpkgs-match";
    nixd.url = "github:nix-community/nixd";
    nixci.url = "github:srid/nixci";

    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";

    # Emacs
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";

    # Devshell
    treefmt-nix.url = "github:numtide/treefmt-nix";

    nur.url = github:nix-community/NUR;
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" ];
      imports = [
        inputs.treefmt-nix.flakeModule
        inputs.nixos-flake.flakeModule
        # inputs.nur.nixosModules.nur
        ./users
        ./home
        ./nixos
        # ./nix-darwin
      ];

      flake = {
        # Configurations for Linux (NixOS) systems
        nixosConfigurations = {
          kiosk = self.nixos-flake.lib.mkLinuxSystem {
            imports = [
              self.nixosModules.graphical
              inputs.sops-nix.nixosModules.sops
              ./machines/nuc-box-2-plus
              ./hosts/kiosk
            ];

            activeUsers = [ "maxou" "milou" ];
          };

          gertry = self.nixos-flake.lib.mkLinuxSystem {
            imports = [
              self.nixosModules.default
              inputs.sops-nix.nixosModules.sops
              ./machines/trigkey-green-g4
              ./hosts/gertry-3000
            ];
            activeUsers = [ "maxou" "milou" ];
            sops = {
              defaultSopsFile = ./secrets/main.yaml;
              defaultSopsFormat = "yaml";
              secrets = {
                ANTHROPIC_API_KEY = { };
              };
            };
          };

          glados = self.nixos-flake.lib.mkLinuxSystem {
            imports = [
              self.nixosModules.graphical
              inputs.sops-nix.nixosModules.sops
              ./machines/framework-7040-amd
              ./hosts/glados
            ];
            activeUsers = [ "maxou" ];
            sops = {
              defaultSopsFile = ./secrets/system.yaml;
              defaultSopsFormat = "yaml";
              secrets = {
                tailnetAuthKey = { };
              };
            };
          };

          wheatley = self.nixos-flake.lib.mkLinuxSystem {
            imports = [
              self.nixosModules.graphical
              inputs.sops-nix.nixosModules.sops
              ./machines/thinkpad-e11
              ./hosts/wheathley
            ];
            activeUsers = [ "maxou" ];
            sops.defaultSopsFile = ./secrets/maxou.yaml;
            sops.defaultSopsFormat = "yaml";
          };
        };

        # Configurations for my (only) macOS machine (using nix-darwin)
        /*
        darwinConfigurations = {
          appreciate = self.nixos-flake.lib.mkMacosSystem {
            nixpkgs.hostPlatform = "aarch64-darwin";
            imports = [
              self.darwinModules.default # Defined in nix-darwin/default.nix
              ./systems/darwin.nix
            ];
          };
        };
        */

        /*
        packages.x86_64-linux = {
          rpi3 = inputs.nixos-generators.nixosGenerate {
            # specialArgs = { inherit inputs outputs; };
            system = "aarch64-linux";
            modules = [
              ./machines/rpi3
            ];
            format = "sd-aarch64-installer";
          };
        };
        */
      };

      perSystem = { self', system, pkgs, lib, config, inputs', ... }: {
        # NOTE: These overlays apply to the Nix shell only. See `nix.nix` for
        # system overlays.
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [
            # inputs.jenkins-nix-ci.overlay
          ];
        };

        nixos-flake.primary-inputs = [ "nixpkgs" "home-manager" "nix-darwin" "nixos-flake" ];

        treefmt.config = {
          projectRootFile = "flake.nix";
          programs.nixpkgs-fmt.enable = true;
          /*
          settings.formatter.nixpkgs-fmt.excludes =
            let
              nixosConfig = self.nixosConfigurations.actual;
              jenkinsPluginsFile = nixosConfig.config.jenkins-nix-ci.plugins-file;
            in
            [ jenkinsPluginsFile ];
          */
        };

        packages.default = self'.packages.activate;
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.nixpkgs-fmt
            pkgs.sops
            pkgs.ssh-to-age
            /*
            (
              let nixosConfig = self.nixosConfigurations.actual;
              in nixosConfig.config.jenkins-nix-ci.nix-prefetch-jenkins-plugins pkgs
            )
            */
          ];
        };
        formatter = config.treefmt.build.wrapper;
      };


    };
}
