{ pkgs
, ...
}: {
  environment.systemPackages = with pkgs; [
    btop
    dmidecode
    htop
    iftop
    iotop
    lshw
    lsof
    pciutils
    s-tui
    usbutils
  ];
}
