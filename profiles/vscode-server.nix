{
  programs.nix-ld.enable = true;

  # container virtualization
  virtualisation.docker.enable = true;

  # hypervisor virtualization
  virtualisation.virtualbox.host.enable = true;

  services.openssh = {
    enable = true;
  };
}
