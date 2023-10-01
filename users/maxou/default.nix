{ config, inputs, pkgs, lib, ...}:
let
  inherit (lib) mkDefault optional optionals;
in
rec {
  # TODO: remove this
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  users.extraUsers.maxou = {
    initialPassword = "password";
    uid = 1000;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "input"
    ]
      ++ (optional (config.hardware.hackrf.enable || config.hardware.rtl-sdr.enable) "plugdev")
      ++ (optional config.networking.networkmanager.enable "networkmanager")
      ++ (optional config.virtualisation.docker.enable "docker")
      ++ (optional config.virtualisation.kvmgt.enable "kvm")
      ++ (optional config.virtualisation.libvirtd.enable "libvirtd")
      ++ (optional config.virtualisation.lxd.enable "lxd")
      ++ (optional config.virtualisation.podman.enable "podman")
      ++ (optional config.virtualisation.virtualbox.host.enable "vboxusers") 
      ++ (optional programs.wireshark.enable "wireshark")
    ;

    shell = pkgs.fish;
  };

  users.users.maxou.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiqi1UA8GNZADOKtH5R+xArRVPqeIgFpIMZzbQwKkbkJ8Y+k5/c6miN3NPluKxl9KYFQKUWSTiv7+r6Z5NWs6fkCG+XvLpYR/h6v9qCCgg2yvKHArbywwN23KacuVXWWzLtT5KbYmOAufHiKn48FmZwoVbU15/dgGaZg/xfd0IeUpMjJ9jhZtl9XM/KVnG5RQIg/RdwEc0CIzjjtkJYp6FPX6fFaSbOlGTk2b4CcfPtnUuvBdSEjl2G+sPxnrQOI6EoCoQKex8UvYCJLRKXPgGA8jUnFaKJX1Oy71eQxEiSMtdBoAIlw81TAWJGdwo5TMpcRTIjqsYxVyweFHKw21yyWIXWNJPyxOX1YFDgRS6sOm2tretH5lSCpemNXfzqYwel9K8jLGxmu6FU6sIFxoBy+AIOjoCYbRfAzDW4C5gIuUSBoLv9V3p0PQxOEwRYSiFdJceEu2tRcwAMAoWBJxrZBnBHJmvH+EupiR+GjhJbcWozMzL6a/wthL19P+AIFU= maxou@kiosk"
  ];

  home-manager.users.maxou = {
    imports = [./home.nix];
  };
}
