{ config, pkgs, lib, ... }:
{
    boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linuxKernel.kernels.linux_6_1.override {
    argsOverride = rec {
      src = pkgs.fetchFromGitHub {
        owner = "thesofproject";
        repo = "linux";
        rev = "es8336-v6.0";
        hash = "sha256-bmPYvmhxlileNj8MSg3IPsyKbeOPqrv+jD+H2AfuZgI=";
      };
      modDirVersion = "6.1.0";
    };
  });
  nixpkgs = {
    overlays = [
      (self: super: {
        linuxZenWMuQSS = pkgs.linuxPackagesFor (pkgs.linuxKernel.kernels.linux_6_1.override {
          structuredExtraConfig = with lib.kernel; {
            CONFIG_SND_SOC_INTEL_SOF_ES8336_MACH=m;
            CONFIG_SND_SOC_ES8316=m;
          };
        });
      })
    ];
  };
}
