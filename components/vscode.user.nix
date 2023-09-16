{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.generators) toKeyValue;

  marketplace-extensions = with inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
    ms-python.python
    ms-python.isort
    ms-python.vscode-pylance
    
    dbaeumer.vscode-eslint
    esbenp.prettier-vscode

    jnoortheen.nix-ide
    arrterian.nix-env-selector

    eamodio.gitlens
    sanaajani.taskrunnercode
    ms-vsliveshare.vsliveshare
    redhat.vscode-yaml
    coolbear.systemd-unit-file
    devicescript.devicescript-vscode
  ];

in {
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;

    extensions = marketplace-extensions;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    
    userSettings = {
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
