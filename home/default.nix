{ self, config, ... }:
{
  flake = {
    homeModules = {
      common = {
        home.stateVersion = "22.11";
        imports = [
          ./direnv.nix
          ./fish.nix
          ./git.nix
          ./powerline.nix
          ./terminal.nix
          ./tmux.nix
          ./zellij.nix
          ./ssh.nix
          #./neovim.nix
          #./starship.nix
          self.inputs.sops-nix.homeManagerModules.sops
          self.inputs.nix-doom-emacs.hmModule
        ];

      };
      common-linux = {
        imports = [
          self.homeModules.common
          ./bash.nix
          ./vscode-server.nix
        ];
      };
      common-darwin = {
        imports = [
          self.homeModules.common
          ./zsh.nix
          ./bash.nix
        ];
      };

      common-linux-graphical.imports = [
        ./firefox.nix
        ./office-productivity.nix
        ./vscode.nix
      ];

      maxou-linux.imports = [
        ./maxou
        # ./emacs.nix # hangs on: inhinting kill emacs
        ./syncthing.nix
      ];
      maxou-linux-graphical.imports = [
        # ./emacs-graphical.nix # hangs on: inhinting kill emacs
        ./maxou/graphical.nix
        ./3d-printing.nix
      ];

      milou-linux.imports = [
        ./milou
      ];
      milou-linux-graphical.imports = [
        ./milou/graphical.nix
      ];
    };
  };
}
