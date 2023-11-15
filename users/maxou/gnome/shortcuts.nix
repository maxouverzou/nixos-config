{ pkgs, lib, ...}: let
  ws-keybindings = lib.attrsets.mergeAttrsList (builtins.genList (
    x: let
      ws = let
        c = (x + 1) / 10;
      in
      builtins.toString (x + 1 - (c * 10 ));
    in {
      "switch-to-application-${toString (x + 1)}" = []; # TODO: 5-9 set w/ gsettings, not gconf
      "move-to-workspace-${toString (x + 1)}" = ["<Shift><Super>${ws}"];
      "switch-to-workspace-${toString (x + 1)}" = ["<Super>${ws}"];
    }
  ) 10);
in {

}
