{ config, ... }: {
  programs.ssh = {
    enable = true;
    forwardAgent = true;
  };

  # GPG agent because SSH agent is not working: https://github.com/nix-community/home-manager/issues/4462
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  #home.file.".ssh/private-key" = {
  #  source = config.sops.secrets.sshKey.path;
  #};
}
