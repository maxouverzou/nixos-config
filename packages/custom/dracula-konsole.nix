{ fetchFromGitHub
, lib
, stdenv
, unstableGitUpdater
}:

stdenv.mkDerivation {
  pname = "dracula-konsole";
  version = "unstable-2022-03-20";

  src = fetchFromGitHub {
    owner = "dracula";
    repo = "konsole";
    rev = "030486c75f12853e9d922b59eb37c25aea4f66f4";
    hash = "sha256-siMSZ6ylw/C4aX9Iv7jNmuT1hgJPtuf6o25VwQWlbYg=";
  };

  installPhase = ''
    cp Dracula.colorscheme $out
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "Dark theme for Konsole ";
    homepage = "https://github.com/dracula/konsole";
    license = lib.licenses.mit;
  };
}



