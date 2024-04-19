{ flake, pkgs, ... }: {
  imports = [
    flake.inputs.nix-ld.nixosModules.nix-ld
  ];

  programs.nix-ld.enable = true;
  # programs.nix-ld.dev.enable = true;

  services.openssh = {
    enable = true;
    extraConfig = ''
      AcceptEnv NIX_LD NIX_LD_LIBRARY_PATH
    '';
  };

  environment.etc."vscode-ssh-support".source = pkgs.stdenv.mkDerivation {
    name = "vscode-ssh-support";
    phases = [ "installPhase" ];
    installPhase = ''
      set -e
      mkdir -p $out
      for lib in ${pkgs.glibc}/lib/ld-linux* ${pkgs.stdenv.cc.cc.lib}/lib/*; do
        ln -sf $lib $out/$(basename $lib)
      done
    '';
  };
}
