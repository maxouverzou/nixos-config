{ fetchFromGitHub
, lib
, makeWrapper
, stdenv
, unstableGitUpdater

  # Dependencies
, bash
, bc
, coreutils
, diffutils
, exiftool
, gnugrep
, gnused
, imagemagick
, xdg-utils
, xdpyinfo
}:

let
  diffImagePath = lib.makeBinPath [
    bash
    bc
    coreutils
    diffutils
    exiftool
    gnugrep
    gnused
    imagemagick
    xdg-utils
    xdpyinfo
  ];
  gitDiffImagePath = lib.makeBinPath [
    bash
    coreutils
    diffutils
    imagemagick
  ];
in
stdenv.mkDerivation {
  pname = "git-diff-image";
  version = "unstable-2023-01-01";

  src = fetchFromGitHub {
    owner = "ewanmellor";
    repo = "git-diff-image";
    rev = "e4932df4e485c2a0df9da4f76703e2e1a3c2192f";
    hash = "sha256-bYObihtgZ1NqiOuXvwAY1GSAwxXZXcqbTRjkxZe4JTE=";
  };

  buildInputs = [ makeWrapper ];

  installPhase = ''
    install -D -m755 -t $out/bin diff-image git_diff_image
    wrapProgram $out/bin/diff-image --prefix PATH : ${diffImagePath}
    wrapProgram $out/bin/git_diff_image --prefix PATH : ${gitDiffImagePath}
  '';

  doInstallCheck = true;
  installCheckPhase = ''
    export PATH=$PATH:$out/bin
    diff-image $src/example-comparison.png $src/example-comparison.png
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "An extension to 'git diff' that provides support for diffing images.";
    homepage = "https://github.com/ewanmellor/git-diff-image";
    license = lib.licenses.cc0;
    mainProgram = "diff-image";
  };
}

