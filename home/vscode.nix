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

    extensions = (with lib; lists.flatten (map attrsets.attrValues (attrsets.attrValues nix4vscode-extensions)))
    ++ (with pkgs.vscode-extensions; [
      ms-toolsai.jupyter # hash mismatch when building via nix4vscode 
    ]);

    userSettings = {
      "explorer.confirmDragAndDrop" = false;
      "task.allowAutomaticTasks" = "on";
      "editor.rulers" = [ 80 100 ];
      "editor.fontFamily" = "'Fira Code'";
      "files.autoSave" = "off";
      "files.exclude" = {
        "**/.git" = true;
        "**/*.js" = {
          when = "$(basename).ts";
        };
      };
      # language settings
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "updateImportsOnFileMove.enabled" = "always";
      };
      "[json]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      "[nix]"."editor.tabSize" = 2;
      "[python]" = {
        "formatting.provider" = "black";
        "formatting.blackPath" = "${pkgs.black}/bin/black";
      };
      "[typescript]" = {
        "updateImportsOnFileMove.enabled" = "always";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.fixAll.eslint" = true;
        };
      };
      "[yaml]" = {
        "editor.defaultFormatter" = "redhat.vscode-yaml";
      };
      "yaml.customTags" = [
        "!Ref scalar"
        "!Equals sequence"
        "!Not sequence"
        "!If sequence"
        "!GetAtt scalar"
        "!Sub scalar"
      ];
      # extension setting
      "gitlens.plusFeatures.enabled" = false;
    };

  };
}
