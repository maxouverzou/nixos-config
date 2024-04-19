{ fetchFromGitHub
, lib
, makeWrapper
, stdenv
, unstableGitUpdater

  # Dependencies
, bash
, jq
, grim
, slurp
, wl-clipboard
, libnotify
, imagemagick
}:

let
  hyprshotPath = lib.makeBinPath [
    bash
    jq
    grim
    slurp
    wl-clipboard
    libnotify
    imagemagick
  ];
in
stdenv.mkDerivation {
  pname = "hyprshot";
  version = "unstable-2023-09-12";

  src = fetchFromGitHub {
    owner = "Gustash";
    repo = "Hyprshot";
    rev = "290a2731fd5d731b2d97153611f44cf8cb0b34fa";
    hash = "sha256-o1Lu0gVoD/licwQMvA4H9Vlk1B0PJ5FyTg2PuU0XYNY=";
  };

  buildInputs = [ ];
  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -D hyprshot $out/bin/hyprshot
    wrapProgram $out/bin/hyprshot --prefix PATH : ${hyprshotPath}
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "An utility to easily take screenshot in Hyprland using your mouse";
    homepage = "https://github.com/Gustash/Hyprshot";
    license = lib.licenses.gpl3;
  };
}
