{ self, config, lib, flake, ... }:
let
  mkUser = user:
    {
      isNormalUser = true;
      # group = "users";
      uid = user.uid;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = user.sshKeys;
    };

  mkUsers = usernames: builtins.listToAttrs (builtins.map
    (username: {
      name = username;
      value = mkUser config.people.users.${username};
    })
    usernames);

  mkHomes = usernames: suffix: builtins.listToAttrs (builtins.map
    (username: {
      name = username;
      value = {
        home.username = username;
        home.homeDirectory = "/home/${username}";
        imports = [
          self.homeModules."common-${suffix}"
          self.homeModules."${username}-${suffix}"
        ];
      };
    })
    usernames);

  # mainUser = "maxou";
  # allUsers = builtins.attrNames config.people.users;
in
{
  # Configuration common to all Linux systems
  flake = {
    nixosModules = {
      # NixOS modules that are known to work on nix-darwin.
      common.imports = [
        ./nix.nix
      ];

      # linux-specific NixOS modules
      default = { config, ... }: {
        imports = [
          self.nixosModules.home-manager
          self.nixosModules.common
          ./avahi.nix
          ./current-location.nix
          ./dns.nix
          ./localization.nix
          ./ntp.nix
          ./security.nix
          ./shell.nix
          ./setup-groups.nix
        ];
        options = {
          activeUsers = lib.mkOption {
            type = with lib.types; listOf str;
            default = [ ];
          };
        };
        config = {
          users.users = mkUsers config.activeUsers;
          home-manager.users = mkHomes config.activeUsers "linux";
          #home-manager.sharedModules = [
          #  self.inputs.sops-nix.homeManagerModules.sops
          #];
        };
      };

      # linux specific NixOS modules for graphical installs
      graphical = { config, ... }: {
        imports = [
          self.nixosModules.default
          ./graphical/1password.nix
          ./graphical/pipewire.nix
          ./graphical/fonts.nix
          ./yubikey.nix
        ];
        home-manager.users = mkHomes config.activeUsers "linux-graphical";
      };
    };
  };
}
