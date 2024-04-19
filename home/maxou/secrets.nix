{ flake, ... }: {
  sops = {
    age.keyFile = /home/maxou/.config/sops/age/keys.txt;
    #age.sshKeyPaths = [ "/home/user/path-to-ssh-key" ];
    defaultSopsFile = ../../secrets/maxou.yaml;
    secrets.sshKey = {
      mode = "0400";
      path = "/home/maxou/.ssh/private-key";
    };
  };
}
