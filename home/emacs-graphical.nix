{ lib, pkgs, ... }: {
  imports = [
    ./emacs.nix
  ];
  
  # hangs on: inhinting kill emacs
  programs.doom-emacs.emacsPackage = lib.mkForce pkgs.emacs;
}
