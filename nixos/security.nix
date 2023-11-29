{
  security.sudo.extraRules = [
    {
      groups = [ "wheel" ];
      commands = [
        { command = "/run/current-system/sw/bin/nix-channel --update"; options = [ "NOPASSWD" ]; }
        { command = "/run/current-system/sw/bin/nixos-rebuild boot"; options = [ "NOPASSWD" ]; }
        { command = "/run/current-system/sw/bin/nixos-rebuild switch"; options = [ "NOPASSWD" ]; }
        { command = "/run/current-system/sw/bin/poweroff"; options = [ "NOPASSWD" ]; }
      ];
    }
  ];

}
