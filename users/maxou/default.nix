{ config, inputs, pkgs, lib, ... }:
let
  inherit (lib) mkDefault optional optionals;
  nix-doom-emacs = inputs.nix-doom-emacs;
in
rec {
  users.extraUsers.maxou = {
    initialPassword = "password";
    uid = 1000;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "input"
      "dialout"
      "tty"
    ]
    ++ (optional (config.hardware.hackrf.enable || config.hardware.rtl-sdr.enable) "plugdev")
    ++ (optional config.networking.networkmanager.enable "networkmanager")
    ++ (optional config.virtualisation.docker.enable "docker")
    ++ (optional config.virtualisation.kvmgt.enable "kvm")
    ++ (optional config.virtualisation.libvirtd.enable "libvirtd")
    ++ (optional config.virtualisation.lxd.enable "lxd")
    ++ (optional config.virtualisation.podman.enable "podman")
    ++ (optional config.virtualisation.virtualbox.host.enable "vboxusers")
    ++ (optional config.programs.wireshark.enable "wireshark")
    ;

    shell = pkgs.fish;

    openssh.authorizedKeys.keys = [
      (lib.readFile ../../resources/users/maxou/kiosk.pub)
      (lib.readFile ../../resources/users/maxou/wheathley.pub)
      (lib.readFile ../../resources/users/maxou/glados.pub)
    ];
  };

  home-manager.users.maxou = {
    imports = [
      nix-doom-emacs.hmModule
      ./home.nix
    ]
    ++ (optional config.services.xserver.enable ./home-graphical.nix)
    ++ (optional config.services.xserver.desktopManager.gnome.enable ./gnome)
    ;
  };

}
