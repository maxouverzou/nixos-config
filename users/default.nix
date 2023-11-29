{ lib
, ...
}:
with lib;

let
  userSubmodule = types.submodule {
    options = {
      uid = mkOption {
        type = with types; nullOr int;
        default = null;
      };
      name = mkOption {
        type = types.str;
      };
      email = mkOption {
        type = types.str;
      };
      sshKeys = mkOption {
        type = with types; listOf str;
        description = ''
          SSH public keys
        '';
      };
    };
  };
  peopleSubmodule = types.submodule {
    options = {
      users = mkOption {
        type = types.attrsOf userSubmodule;
      };
      activeUsers = mkOption {
        type = with types; listOf str;
        description = ''
          Users to provision on the system.

          Admin users in all contexts.
        '';
      };
    };
  };
in
{
  options = {
    people = mkOption {
      type = peopleSubmodule;
    };
  };
  config = {
    people = import ./config.nix;
  };
}
