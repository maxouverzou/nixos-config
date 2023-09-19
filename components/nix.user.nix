{ config
, inputs
, ...
}: {
  config = {
    nixpkgs = {
      overlays = [
        inputs.nurpkgs.overlay
        (import ../overlays/packages.nix)
      ];
      config = {
        permittedInsecurePackages = [
          "electron-20.3.12" # https://github.com/NixOS/nixpkgs/issues/230212#issuecomment-1544083194
        ];
      };
    };
  };

}
