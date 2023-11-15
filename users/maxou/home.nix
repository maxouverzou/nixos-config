{ config
, inputs
, lib
, pkgs
, ...
}:
let
  inherit (lib.generators) toKeyValue;
  # hyprland = inputs.hyprland;
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium
    moderncv fontawesome5 academicons multirow arydshln # moderncv & dependencies
      ;
  });
in
{

  imports =
    [
      ../../components/nix.user.nix
    ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "maxou";
  home.homeDirectory = "/home/maxou";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # TODO: move somewhere else
  nixpkgs.config.allowUnfree = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  programs.bash.enable = true;
  programs.powerline-go.enable = true;

  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom.d;
    emacsPackage = lib.mkDefault pkgs.emacs-nox;
    emacsPackagesOverlay = self: super: {
      beancount = self.trivialBuild {
        pname = "beancount";
        ename = "beancount";
        version = "unstable-2023-07-08";
        src = pkgs.fetchFromGitHub {
          owner = "beancount";
          repo = "beancount-mode";
          rev = "0f1e33067e5032382f425b5280169f50aa7dd497";
          sha256 = "sha256-2NSo9S0qc1MsLqoOQFQ6AJg53QlRCqN7zQoYj1dChKA=";
        };
      };
    };
  };

  programs.ssh = {
    enable = true;
    forwardAgent = true;
  };

  services.emacs.enable = true;

  # GPG agent because SSH agent is not working: https://github.com/nix-community/home-manager/issues/4462
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };

  services.syncthing.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    awscli2
    tile-stitch

    beancount
    fava

    (python3.withPackages (ps: with ps; [
      ipython
    ]))

    # python3 # treemacs wants that
    # texlive.combined.scheme-medium # doomemacs / latex needs that
    tex

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    ".npmrc".text = toKeyValue { } { fund = false; update-notifier = false; };
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/maxou/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    extraConfig = {
      user = {
        name = "Maxou Verzou";
        email = "maxou@integratedintegrals.com";
      };
    };
  };

  programs.gitui.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
