# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  networking.networkmanager.enable = true;

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  # hardware.pulseaudio.enable = true;
  services.pipewire.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard # ?
      mako # ?
      alacritty
      # wofi # ?
      dmenu
      xwayland
      waybar # ?
      kanshi # ?
      gnome3.gnome-disk-utility
      networkmanager_dmenu

      rlwrap
      htop
      multitail
      xxd
      tree
    ];
  };

  programs.waybar.enable = true;

  nixpkgs.config.allowUnfree = true;
  programs.steam.enable = true;

  services.redshift = {
    enable = true;
  };
  location.provider = "geoclue2";

  services.emacs = {
    enable = true;
    install = true;
    defaultEditor = true;
    # package = "emacs-nox";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.max = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "networkmanager" "docker" "sway" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    _1password-gui
    firefox
    mpv
    source-sans-pro
    youtube-dl

    python38
    python38Packages.virtualenv

    mucommander
    spaceFM
    pcmanfm

    awscli2
    sublime3
    vscode

    discord

    (
      pkgs.writeTextFile {
        name = "startsway";
        destination = "/bin/startsway";
        executable = true;
        text = ''
          	  #!${pkgs.bash}/bin/bash

                    systemctl --user import-environment
          	  exec systemctl --user start sway.service 
          	'';
      }
    )
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  systemd.user.targets.sway-session = {
    description = "Sway compositor session";
    documentation = [ "man:systemd.special(7)" ];
    bindsTo = [ "graphical-session.target" ];
    wants = [ "graphical-session-pre.target" ];
    after = [ "graphical-session-pre.target" ];
  };

  systemd.user.services.sway = {
    description = "Sway - Wayland window manager";
    documentation = [ "man:sway(5)" ];
    bindsTo = [ "graphical-session.target" ];
    wants = [ "graphical-session-pre.target" ];
    after = [ "graphical-session-pre.target" ];
    environment.PATH = lib.mkForce null;
    serviceConfig = {
      Type = "simple";
      ExecStart = ''
        	${pkgs.dbus}/bin/dbus-run-session ${pkgs.sway}/bin/sway --config /etc/sway/config --debug
      '';
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  systemd.user.services.kanshi = {
    description = "kanshi output autoconfig";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = ''
        ${pkgs.kanshi}/bin/kanshi
      '';
      RestartSec = 5;
      Restart = "always";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

