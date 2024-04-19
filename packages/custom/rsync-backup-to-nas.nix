{ writeShellApplication, rsync, ... }:
# rudimentary back up script
writeShellApplication {
  name = "rsync-backup-to-nas";
  runtimeInputs = [ rsync ];
  text = builtins.readFile ./rsync-backup-to-nas.sh;
}
