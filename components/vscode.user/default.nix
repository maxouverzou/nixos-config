{ config
, inputs
, lib
, pkgs
, ...
}:
let
  nix4vscode-extensions = (import ./extensions.nix) { pkgs = pkgs; lib = lib; };

  universal-extensions = with inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
    arrterian.nix-env-selector
    jnoortheen.nix-ide
    sanaajani.taskrunnercode
    # ms-vsliveshare.vsliveshare
    # devicescript.devicescript-vscode
    vscode-org-mode.org-mode
  ];

in
{
  home.packages = with pkgs; [
    black
    nixpkgs-fmt
    nodePackages_latest.prettier
    nodejs_20
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    package = pkgs.vscode;

    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-marketplace; [
      nix4vscode-extensions.ms-python.python
      nix4vscode-extensions.ms-python.isort
      nix4vscode-extensions.ms-python.vscode-pylance
      nix4vscode-extensions.dbaeumer.vscode-eslint
      nix4vscode-extensions.esbenp.prettier-vscode
      # nix4vscode-extensions.eamodio.gitlens
      nix4vscode-extensions.redhat.vscode-yaml
      nix4vscode-extensions.coolbear.systemd-unit-file
      nix4vscode-extensions.tamasfe.even-better-toml
    ] ++ universal-extensions;


    userSettings = {
      "editor.fontFamily" = [
        "'Fira Code'"
        "'Droid Sans Mono'"
        "'monospace'"
        "monospace"
      ];
      "files.autoSave" = "off";
      "[nix]"."editor.tabSize" = 2;
      "[typescript]" = {
        "typescript.updateImportsOnFileMove.enabled" = "always";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.fixAll.eslint" = true;
        };
      };
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "updateImportsOnFileMove.enabled" = "always";
      };
      "[python]" = {
        "formatting.provider" = "black";
        "formatting.blackPath" = "${pkgs.black}/bin/black";
      };
      "yaml.customTags" = [
        "!Ref scalar"
        "!Equals sequence"
        "!Not sequence"
        "!If sequence"
        "!GetAtt scalar"
        "!Sub scalar"
      ];
      "gitlens.plusFeatures.enabled" = false;
      "files.exclude" = {
        "**/.git" = true;
        "**/*.js" = {
          when = "$(basename).ts";
        };
      };
      "task.allowAutomaticTasks" = "on";
      "editor.rulers" = [ 80 100 ];
      "terminal.integrated.profiles.linux" = {
        "Nix Shell" = {
          "path" = "fish";
          "args" = [
            "-i"
            "-c"
            "nix-shell"
          ];
          "icon" = "terminal-linux";
        };
      };
      "terminal.integrated.defaultProfile.linux" = "Nix Shell";
      "explorer.confirmDragAndDrop" = false;
    };

  };
}
