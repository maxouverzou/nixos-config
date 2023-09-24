self: super:
{
  python3 = import ../overrides/python3.nix super;
  logseq = import ../overrides/logseq.nix super;
  networkmanager-with-introspection = import ../overrides/networkmanager-with-introspection.nix super;
}
