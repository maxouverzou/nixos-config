{ pkgs, ... }:

# LaTex w/ support for moderncv
pkgs.texlive.combine {
  inherit (pkgs.texlive) scheme-medium
    moderncv fontawesome5 academicons multirow arydshln
    ;
}
