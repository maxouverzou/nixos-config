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
          # ./powerline.nix
          ./terminal.nix
          ./tmux.nix
          ./zellij.nix
          ./ssh.nix
          #./neovim.nix
          ./starship.nix
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
        ./ssh-with-1password.nix
      ];

      maxou-linux.imports = [
        ./maxou

      ];
      maxou-linux-graphical.imports = [
        ./maxou/graphical.nix
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
