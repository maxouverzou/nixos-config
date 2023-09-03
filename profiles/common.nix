{
  config,
  pkgs,
  lib,
  inputs,
  outputs,
  ...
}: {
  imports =
    [
      inputs.home-manager.nixosModules.home-manager
      ../services/ntp.nix
      ../services/dns.nix
      ../services/nix.nix
      ../services/localization.nix
    ];

  boot.tmp.useTmpfs = lib.mkDefault true;

  # show IP in login screen
  # https://github.com/NixOS/nixpkgs/issues/63322
  environment.etc."issue.d/ip.issue".text = "\\4\n";
  networking.dhcpcd.runHook = "${pkgs.utillinux}/bin/agetty --reload";

  environment.systemPackages = with pkgs; [
    htop
    iotop
    iftop
    wget
    curl
    whois
    lsof
    pv
    xz
    zip
    unzip
    vim
    file
    tree
    tealdeer
    jq
    yq
    gitAndTools.gitFull
  ];

  environment.variables = {
    "EDITOR" = "vim";
    "VISUAL" = "vim";
  };

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # not supported with flakes
  # system.copySystemConfiguration = true;

}