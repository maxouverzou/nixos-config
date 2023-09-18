{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  nix4vscode-extensions = (import ./extensions.nix) { pkgs = pkgs; lib = lib; };

  universal-extensions = with inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
    arrterian.nix-env-selector
    jnoortheen.nix-ide
    sanaajani.taskrunnercode
    ms-vsliveshare.vsliveshare
    devicescript.devicescript-vscode
  ];

in {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    
    package = pkgs.vscodium;
    
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-marketplace; [
      nix4vscode-extensions.ms-python.python
      nix4vscode-extensions.ms-python.isort
      nix4vscode-extensions.ms-python.vscode-pylance
      nix4vscode-extensions.dbaeumer.vscode-eslint
      nix4vscode-extensions.esbenp.prettier-vscode
      nix4vscode-extensions.eamodio.gitlens
      nix4vscode-extensions.redhat.vscode-yaml
      nix4vscode-extensions.coolbear.systemd-unit-file
      nix4vscode-extensions.tamasfe.even-better-toml
    ] ++ universal-extensions;

    
    userSettings = {
      "editor.fontFamily" = ["'Fira Code'" "'Droid Sans Mono'" "'monospace'" "monospace"];
      "files.autoSave" = "off";
      "[nix]"."editor.tabSize" = 2;
      "[typescript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      "[typescript]"."editor.formatOnSave" = true;
      "[typescript]"."editor.codeActionsOnSave" = {
        "source.fixAll.eslint" = true;
      };
      "yaml.customTags" = [
        "!Ref scalar"
        "!Equals sequence"
        "!Not sequence"
        "!If sequence"
        "!GetAtt scalar"
        "!Sub scalar"
      ];
      "files.exclude" = {
        "**/.git" = true;
        "**/*.js" = {
          when = "$(basename).ts";
        };
      };
      # "typescript.tsdk" = "node_modules/typescript/lib";
      "task.allowAutomaticTasks" = "on";
      "editor.rulers" = [80 100];
      "terminal.integrated.profiles.linux" = {
        "Nix Shell" = {
          "path" = "fish";
          "args" = [
            "-i" "-c" "nix-shell"
          ];
          "icon" = "terminal-linux";
        };
      };
      "terminal.integrated.defaultProfile.linux" = "Nix Shell";
    };

  };
}
