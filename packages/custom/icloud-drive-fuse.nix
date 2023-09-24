{ fetchFromGitHub
, lib
, stdenv
, unstableGitUpdater

  # Dependencies
, python3
}:

stdenv.mkDerivation {
  pname = "icloud-drive-fuse";
  version = "unstable-2020-08-11";

  src = fetchFromGitHub {
    owner = "maxouverzou";
    repo = "icloud-drive-fuse";
    rev = "1d17a73a80308bd7431b95556ab2d256927461af";
    hash = "sha256-+5hW5cMPPmjhi7SoJyuBhGGGMeSKqwEU7tWiqL7+NEo=";
  };

  buildInputs = [ (python3.withPackages (p: with p; [ cachetools fusepy pyicloud ])) ];

  doCheck = false;

  installPhase = ''
    install -D iCloudDriveFuse.py $out/bin/icloud-drive-fuse
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "iCloud Drive FUSE filesystem";
    homepage = "https://github.com/maxouverzou/icloud-drive-fuse/tree/master";
    license = lib.licenses.gpl3Plus;
  };
}

