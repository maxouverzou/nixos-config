{ waybar, fetchFromGitHub, ... }:
# module hyprland/workspaces: Unknown module: hyprland/workspaces
waybar.overrideAttrs (oldAttrs: {
  #  pname = "waybar";
  #  version = "0.9.22";
  #  src = fetchFromGitHub {
  #    owner = "Alexays";
  #    repo = "Waybar";
  #    rev = "0.9.22";
  #    hash = "sha256-9LJDA+zrHF9Mn8+W9iUw50LvO+xdT7/l80KdltPrnDo=";
  #  };

  mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
})
