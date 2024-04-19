{ pkgs, lib, ... }:

# Platform-independent terminal setup
{
  home.packages = with pkgs; [
    bc
    curl
    dig
    fd
    file
    mc
    moreutils
    multitail
    pv
    ranger
    ripgrep
    rlwrap
    screen
    sd
    tealdeer
    tree
    unzip
    wget
    whois
    xxd
    xz
    yq
    zip

    # Useful for Nix development
    # devour-flake  # undefined
    nixci
    nil
    nixpkgs-fmt

    # Publishing
    asciinema

    # Dev
    gh
    fuckport
  ];

  home.shellAliases = rec {
    e = "nvim";
    g = "git";
    lg = "lazygit";
    l = lib.getExe pkgs.lsd;
    t = tree;
    tree = "${lib.getExe pkgs.lsd} --tree";
    beep = "say 'beep'";
  };

  programs = {
    bat.enable = true;
    autojump.enable = false;
    zoxide.enable = true;
    fzf.enable = true;
    jq.enable = true;
    nix-index.enable = true;
    htop = {
      enable = true;
      settings = {
        show_program_path = false; # hide nix-store paths
      };
    };
    # rio.enable = true;
  };
}
