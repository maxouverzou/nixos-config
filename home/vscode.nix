{ config
, flake
, lib
, pkgs
, ...
}:
let
  nix4vscode-extensions = (import ./vscode/extensions.nix) { pkgs = pkgs; lib = lib; };
in
{
  home.packages = with pkgs; [
    elixir
    black
    nixpkgs-fmt
    nodePackages_latest.prettier
    nodejs_20
  ];

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
      nix4vscode-extensions.arrterian.nix-env-selector
      nix4vscode-extensions.jnoortheen.nix-ide
      nix4vscode-extensions.sanaajani.taskrunnercode
      nix4vscode-extensions.vscode-org-mode.org-mode
      # nix4vscode-extensions.ms-toolsai.jupyter # hash mismatch
      nix4vscode-extensions.gleam.gleam
      nix4vscode-extensions.jakebecker.elixir-ls
      nix4vscode-extensions.github.vscode-github-actions
    ];


    userSettings = {
      "editor.fontFamily" = "'Fira Code'";
      /* [
        "'Fira Code'"
        "'Droid Sans Mono'"
        "'monospace'"
        "monospace"
      ]; */
      "files.autoSave" = "off";
      "[nix]"."editor.tabSize" = 2;
      # "[nix]"
      "[typescript]" = {
        "updateImportsOnFileMove.enabled" = "always";
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
      "explorer.confirmDragAndDrop" = false;
    };

  };
}
