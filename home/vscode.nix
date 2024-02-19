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

    extensions = with lib; lists.flatten (map attrsets.attrValues (attrsets.attrValues nix4vscode-extensions));

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
