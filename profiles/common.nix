{ config
, pkgs
, lib
, inputs
, outputs
, ...
}: {
  imports =
    [
      inputs.home-manager.nixosModules.home-manager
      ../components/ntp.system.nix
      ../components/dns.system.nix
      ../components/nix.system.nix
      ../components/localization.system.nix
      ../components/security.system.nix
      ../components/shell.system.nix
    ];

  boot.tmp.useTmpfs = lib.mkDefault true;

  # show IP in login screen
  # https://github.com/NixOS/nixpkgs/issues/63322
  environment.etc."issue.d/ip.issue".text = "\\4\n";
  networking.dhcpcd.runHook = "${pkgs.utillinux}/bin/agetty --reload";

  environment.systemPackages = with pkgs; [
    curl
    file
    gitAndTools.gitFull
    htop
    iftop
    iotop
    jq
    lsof
    moreutils
    multitail
    pv
    rlwrap
    s-tui
    tealdeer
    tmux
    tree
    unzip
    vim
    wget
    whois
    xxd
    xz
    yq
    zip
  ];

  programs.fish.enable = true;

  environment.variables = {
    "EDITOR" = "vim";
    "VISUAL" = "vim";
  };

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # not supported with flakes
  # system.copySystemConfiguration = true;

}
