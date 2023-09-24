{ fetchFromGitHub
, lib
, stdenv
, makeWrapper
, unstableGitUpdater

  # Dependencies
, bash
, rofi-wayland
, networkmanager
, qrencode
, networkmanagerapplet
}:
let 
  rofiNetworkManagerPath = lib.makeBinPath [
    bash
    rofi-wayland
    networkmanager
    qrencode
    networkmanagerapplet
  ];
in stdenv.mkDerivation {
  pname = "rofi-network-manager";
  version = "unstable-2023-06-25s";

  src = fetchFromGitHub {
    owner = "P3rf";
    repo = "rofi-network-manager";
    rev = "19a3780fa3ed072482ac64a4e73167d94b70446b";
    hash = "sha256-sK4q+i6wfg9k/Zjszy4Jf0Yy7dwaDebTV39Fcd3/cQ0=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -D rofi-network-manager.sh $out/bin/rofi-network-manager
    install -D rofi-network-manager.conf $out/bin/rofi-network-manager.conf
    wrapProgram $out/bin/rofi-network-manager --prefix PATH : ${rofiNetworkManagerPath}
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "A Network manager for Tiling Window Managers";
    homepage = "https://github.com/P3rf/rofi-network-manager";
    license = lib.licenses.mit;
  };
}

