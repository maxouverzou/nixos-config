{ pkgs, ... }: {
  imports = [
    ../syncthing.nix
    ./secrets.nix
    ../emacs.nix
    ../nushell.nix
  ];

  home.packages = with pkgs; [
    awscli2
    ssm-session-manager-plugin

    # gleam
    helix
    rsync-backup-to-nas

    encfs
    sshfs
  ];

  home.file.".jq".source = ./home.jq;
}
