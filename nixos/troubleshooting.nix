{
  environment.systemPackages = with pkgs; [
    lsof
    btop
    iftop
    iotop
    s-tui
    pciutils
    dmidecode
    lshw
    usbutils
  ];
}
