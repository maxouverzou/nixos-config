resolved: stable:

let
  inherit (builtins) mapAttrs;
  specify = builtins.mapAttrs (resolve [ ]);

  community-vscode-extensions = (import <community-vscode-extensions>).extensions.${stable.system}.forVSCodeVersion resolved.vscode.version;
  open-vsx = { _name = "open-vsx"; vscode-extensions = community-vscode-extensions.open-vsx; };
  vscode-marketplace = { _name = "vscode-marketplace"; vscode-extensions = community-vscode-extensions.vscode-marketplace; };
in
specify {
  gpx-reduce = any;
  tile-stitch = any;
  vscode-extensions = namespace {
    ms-python.isort = any;
  };
}