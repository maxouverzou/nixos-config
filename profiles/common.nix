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

  boot.binfmt.emulatedSystems = []
    ++ (lib.optional (pkgs.system == "x86_64-linux") "aarch64-linux");

  # show IP in login screen
  # https://github.com/NixOS/nixpkgs/issues/63322
  environment.etc."issue.d/ip.issue".text = "\\4\n";
  networking.dhcpcd.runHook = "${pkgs.utillinux}/bin/agetty --reload";

  environment.systemPackages = with pkgs; [
    bc
    curl
    file
    gitAndTools.gitFull
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
    tree
    unzip
    vim
    wget
    whois
    xxd
    xz
    yq
    zip
    screen

    mc
    ranger

    acpi # for tmux-battery
  ];

  programs.htop = {
    enable = true;
    settings = {
      show_program_path = false; # hide nix-store paths
    };
  };

  programs.tmux = {
    enable = true;
    plugins = [
      pkgs.tmuxPlugins.battery
      pkgs.tmuxPlugins.sysstat
    ];
    extraConfig = ''
      set -g @sysstat_mem_view_tmpl '#{mem.pused}'
      set -g @sysstat_cpu_view_tmpl '#{cpu.pused}'

      set -g status-right 'BAT:#{battery_percentage} CPU:#{sysstat_cpu} MEM:#{sysstat_mem} #{sysstat_loadavg}'
      run-shell ${pkgs.tmuxPlugins.battery}/share/tmux-plugins/battery/battery.tmux
      run-shell ${pkgs.tmuxPlugins.sysstat}/share/tmux-plugins/sysstat/sysstat.tmux
    '';  
};

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
