{ fetchFromGitHub
, lib
, stdenv
, unstableGitUpdater
, makeWrapper
# dependencies
, grub2
, grub2_efi
, rsync
}: let
  wrapperPath = with lib; makeBinPath ([
    grub2
    rsync
  ]);
in stdenv.mkDerivation {
  pname = "glim";
  version = "unstable-2023-08-20";

  src = fetchFromGitHub {
    owner = "thias";
    repo = "glim";
    rev = "5bbf5acb592c51f7937d18e42712432b7c9aac6d";
    hash = "sha256-7kMTmzR27g+r3xhzrsW6X2PdJM7lS8clLe3ns9aNFRU=";
  };

  buildInputs = [ grub2 grub2_efi ];
  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    install -D glim.sh $out/bin/glim

    mkdir -p "$out/share/glim"
    cp -r "grub2" "$out/share/glim"
    cp "README.md" "$out/share/glim"
  '';

  postFixup = ''
    substituteInPlace $out/bin/glim \
      --replace '`dirname $0`' "$out/share/glim" \
      --replace '$(dirname "$0")' "$out/share/glim" \
      --replace "/usr/lib/grub/x86_64-efi" "${grub2_efi}/lib/grub/x86_64-efi" \
      --replace "/usr/lib/grub/i386-pc" "${grub2}/lib/grub/i386-pc"

    # Ensure all dependencies are in PATH
    wrapProgram $out/bin/glim \
      --prefix PATH : "${wrapperPath}"
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "GRUB2 Live ISO Multiboot";
    homepage = "https://github.com/thias/glim";
    # license = lib.licenses.gpl3Plus;
  };
}

