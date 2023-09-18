{ lib
, stdenv
, fetchFromGitHub
, makeWrapper
# Dependencies
, python3
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "icloud-drive-fuse";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "ixs";
    repo = "iCloudDriveFuse";
    rev = "ffe78e562186a3c38bf9202fd51ff776486f37e1";
    hash = "sha256-";
  };

  /*
  patches = [
    #  allow for plugin update check, but no calibre version check
    (fetchpatch {
      name = "0001-only-plugin-update.patch";
      url = "https://raw.githubusercontent.com/debian-calibre/calibre/debian/${finalAttrs.version}-1/debian/patches/0001-only-plugin-update.patch";
      hash = "sha256-uL1mSjgCl5ZRLbSuKxJM6XTfvVwog70F7vgKtQzQNEQ=";
    })
    (fetchpatch {
      name = "0007-Hardening-Qt-code.patch";
      url = "https://raw.githubusercontent.com/debian-calibre/calibre/debian/${finalAttrs.version}-1/debian/patches/0007-Hardening-Qt-code.patch";
      hash = "sha256-9P1kGrQbWAWDzu5EUiQr7TiCPHRWUA8hxPpEvFpK20k=";
    })
  ]
  ++ lib.optional (!unrarSupport) ./dont_build_unrar_plugin.patch;
  */

/*
  prePatch = ''
    sed -i "s@\[tool.sip.project\]@[tool.sip.project]\nsip-include-dirs = [\"${python3Packages.pyqt6}/${python3Packages.python.sitePackages}/PyQt6/bindings\"]@g" \
      setup/build.py

    # Remove unneeded files and libs
    rm -rf src/odf resources/calibre-portable.*
  '';
*/

  nativeBuildInputs = [
    cmake
    pkg-config
    qmake
    removeReferencesTo
    wrapGAppsHook
    wrapQtAppsHook
  ];

  buildInputs = with python3Packages; [
      fusepy
      pyiCloud
    ];

  installPhase = ''
    runHook preInstall

    export HOME=$TMPDIR/fakehome
    export POPPLER_INC_DIR=${poppler_utils.dev}/include/poppler
    export POPPLER_LIB_DIR=${poppler_utils.out}/lib
    export MAGICK_INC=${imagemagick.dev}/include/ImageMagick
    export MAGICK_LIB=${imagemagick.out}/lib
    export FC_INC_DIR=${fontconfig.dev}/include/fontconfig
    export FC_LIB_DIR=${fontconfig.lib}/lib
    export PODOFO_INC_DIR=${podofo.dev}/include/podofo
    export PODOFO_LIB_DIR=${podofo.lib}/lib
    export XDG_DATA_HOME=$out/share
    export XDG_UTILS_INSTALL_MODE="user"

    ${python3Packages.python.pythonForBuild.interpreter} setup.py install --root=$out \
      --prefix=$out \
      --libdir=$out/lib \
      --staging-root=$out \
      --staging-libdir=$out/lib \
      --staging-sharedir=$out/share

    PYFILES="$out/bin/* $out/lib/calibre/calibre/web/feeds/*.py
      $out/lib/calibre/calibre/ebooks/metadata/*.py
      $out/lib/calibre/calibre/ebooks/rtf2xml/*.py"

    sed -i "s/env python[0-9.]*/python/" $PYFILES
    sed -i "2i import sys; sys.argv[0] = 'calibre'" $out/bin/calibre

    mkdir -p $out/share
    cp -a man-pages $out/share/man

    runHook postInstall
  '';

  meta = {
    homepage = "https://calibre-ebook.com";
    description = "Comprehensive e-book software";
    longDescription = ''
      calibre is a powerful and easy to use e-book manager. Users say it’s
      outstanding and a must-have. It’ll allow you to do nearly everything and
      it takes things a step beyond normal e-book software. It’s also completely
      free and open source and great for both casual users and computer experts.
    '';
    changelog = "https://github.com/kovidgoyal/calibre/releases/tag/v${finalAttrs.version}";
    license = if unrarSupport
              then lib.licenses.unfreeRedistributable
              else lib.licenses.gpl3Plus;
    maintainers = with lib.maintainers; [ pSub AndersonTorres ];
    platforms = lib.platforms.unix;
    broken = stdenv.isDarwin;
  };
})