{ lib, pkgs, ... }: {
  home.packages = with pkgs; [
    beancount
    # fava
    # tex-mine
  ];

  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./emacs/doom;
    emacsPackage = lib.mkDefault pkgs.emacs28-nox;
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

  services.emacs.enable = true;

}
