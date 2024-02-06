{ pkgs, ... }: {
  imports = [
    ../syncthing.nix
    ./secrets.nix
    ../emacs.nix
  ];

  home.packages = with pkgs; [
    awscli2
    ssm-session-manager-plugin

    gleam

    encfs
    sshfs
  ];
}
