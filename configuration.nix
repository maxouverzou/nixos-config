# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # ./sof-fixes.nix
      ./kde.nix
      ./tailscale.nix
      ./plex.nix
      <home-manager/nixos>
    ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "kiosk"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.extraHosts =
    ''
      127.0.0.1 www.sublimetext.com # works for subl 3
      127.0.0.1 license.sublimehq.com # 4?
    '';

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  hardware.bluetooth.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.maxou = {
    isNormalUser = true;
    description = "Maxou";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    # packages = with pkgs; [];
  };

  users.users.milou = {
    isNormalUser = true;
    description = "Milou";
    initialPassword = "mypassword";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  home-manager.users.maxou = {pkgs, ...}: {
    home.stateVersion = "23.05";

    home.packages = with pkgs; [
      curl
    ];

    programs.bash.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # vs-code
    MOZ_ENABLE_WAYLAND = "1";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	vim
	firefox-wayland
	git

	htop
	alacritty
	openscad	
	vlc
	sublime3 # august 23: sublime4 requires openssl 1.1, which is marked as insecure
	youtube-dl
	cantor
	cider
	
        pkgs.fontconfig # steam?

	winetricks
	wineWowPackages.waylandFull
	# lutris
	discord
	bottles
	
	
	vscode
	nodejs_20

        qgis-ltr
	
  ];

  # pipewire setup

  # conflicts with pipewire
  # sound.enable = false;
 
  hardware.pulseaudio.enable = false;

  # rtkit is optional but recommended for pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };


  fonts.fonts = with pkgs; [
    liberation_ttf # steam?
    oxygenfonts
    source-code-pro
    fira-code
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  programs._1password.enable = true;
  programs._1password-gui.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  services.xserver.enable = true;
  services.openssh.enable = true;

  virtualisation.docker.enable = true;

  programs.nix-ld.enable = true; # remove vscode

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
