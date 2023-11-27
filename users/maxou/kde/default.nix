{ pkgs, lib, ...}: {
  imports = [
    ../../../components/theme-breeze.user.nix
    ./packages.nix
  ];

  # TODO see https://github.com/nix-community/home-manager/issues/1586#issuecomment-1783578675
  # https://github.com/nix-community/home-manager/issues/1586
  home.file.".mozilla/native-messaging-hosts/org.kde.plasma.browser_integration.json".source = "${pkgs.plasma-browser-integration}/lib/mozilla/native-messaging-hosts/org.kde.plasma.browser_integration.json";

  programs.plasma = {
    enable = true;
    workspace = {
      theme = "breeze-dark";
      colorscheme = "BreezeDark";
    };    
  };
}