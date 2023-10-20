{ fetchFromGitHub
, lib
, stdenv
, unstableGitUpdater

  # Dependencies
, gawk
}:

stdenv.mkDerivation rec {
  pname = "unbound-blocklist-stevenblack";
  version = "3.14.17";

  src = fetchFromGitHub {
    owner = "StevenBlack";
    repo = "hosts";
    rev = "${version}";
    sparseCheckout = [ "hosts" ];
    hash = "sha256-3J/raVqMNEEqBEpaCt5j5/N7LoUisYtPggh1UFys3mE=";
  };

  buildInputs = [ gawk ];

  installPhase = ''
    awk '$1 == "0.0.0.0" { printf "local-zone: \"%s\" redirect\nlocal-data: \"%s A 0.0.0.0\"\n", tolower($2), tolower($2) }' hosts > $out
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "adblock list for unbound";
    license = lib.licenses.mit;
  };
}

