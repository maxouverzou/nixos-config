{pkgs, ...}: {
  programs.nix-ld.dev.enable = true;

  # container virtualization
  virtualisation.docker.enable = true;

  # hypervisor virtualization
  # virtualisation.virtualbox.host.enable = true;

  services.openssh = {
    enable = true;
    extraConfig = ''
      AcceptEnv NIX_LD NIX_LD_LIBRARY_PATH
    '';
  };

  environment.etc."vscode-ssh-support".source = pkgs.stdenv.mkDerivation {
    name = "vscode-ssh-support";
    phases = ["installPhase"];
    installPhase = ''
      set -e
      mkdir -p $out
      for lib in ${pkgs.glibc}/lib/ld-linux* ${pkgs.stdenv.cc.cc.lib}/lib/*; do
        ln -sf $lib $out/$(basename $lib)
      done
    '';
  };
}
