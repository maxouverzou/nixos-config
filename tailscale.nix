{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tailscale-systray
    wl-clipboard
    trayscale
    # tailscale
  ];
  services.tailscale.enable = true;
}
