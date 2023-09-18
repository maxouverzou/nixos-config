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
    owner = "ixs";
    repo = "iCloudDriveFuse";
    rev = "ffe78e562186a3c38bf9202fd51ff776486f37e1";
    hash = "sha256-";
  };

  buildInputs = [ (python3.withPackages (p: with p; [ fusepy pyiCloud ])) ];

  doCheck = false;

  installPhase = ''
    install -D iCloudDriveFuse.py $out/bin/icloud-drive-fuse
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "iCloud Drive FUSE filesystem";
    homepage = "https://github.com/ixs/iCloudDriveFuse/tree/master";
    license = lib.licenses.gpl3Plus;
  };
}

