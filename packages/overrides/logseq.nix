{ lib, stdenv, git, logseq, electron_20, ... }:
# https://github.com/NixOS/nixpkgs/issues/230212#issuecomment-1544083194
logseq.overrideAttrs (oldAttrs: {
  postFixup = ''
    makeWrapper ${electron_20}/bin/electron $out/bin/${oldAttrs.pname} \
      --set "LOCAL_GIT_DIRECTORY" ${git} \
      --add-flags $out/share/${oldAttrs.pname}/resources/app \
      --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}" \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ stdenv.cc.cc.lib ]}"
  '';
})
