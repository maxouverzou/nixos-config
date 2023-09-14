{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tailscale-systray
    wl-clipboard # tailscale needs that

    trayscale
  ];
  services.tailscale.enable = true;
}
