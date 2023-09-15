{ config
, inputs
, ...
}: {
  config = {
    nixpkgs.overlays = [
      inputs.nurpkgs.overlay
    ];
  };

}
