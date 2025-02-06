{ pkgs, ... }: {
  imports = [
    ../syncthing.nix
    # ./secrets.nix
    ../nushell.nix
  ];

  home.packages = with pkgs; [
    awscli2
    ssm-session-manager-plugin

    # gleam
    helix
    rsync-backup-to-nas
  ];

  home.file.".jq".source = ./home.jq;
}
