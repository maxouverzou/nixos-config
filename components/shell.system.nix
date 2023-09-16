{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    any-nix-shell
  ];

  programs.fish.enable = true;
  programs.fish.promptInit = ''
    any-nix-shell fish --info-right | source
  '';
  users.defaultUserShell = pkgs.fish;
}