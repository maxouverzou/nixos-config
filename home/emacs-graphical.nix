{ lib, pkgs, ... }: {
  imports = [
    ./emacs.nix
  ];
  
  programs.doom-emacs.emacsPackage = lib.mkForce pkgs.emacs28;
}
