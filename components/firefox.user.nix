{ pkgs, lib, config, ... }:
let
  inherit (lib) mkDefault optional optionals;
in
rec {
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-wayland;
    profiles.managed = {
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        onepassword-password-manager
        plasma-integration
        tree-style-tab

        multi-account-containers
        privacy-badger
        ublock-origin

        reddit-enhancement-suite
        old-reddit-redirect

        # user-agent switcher and manager?
      ];

      settings = {
        "browser.newtabpage.activity-stream.discoverystream.editorsPicksHeader.enabled" = false;
        "browser.newtabpage.activity-stream.discoverystream.newSponsoredLabel.enabled" = false;
        "browser.newtabpage.activity-stream.discoverystream.sponsored-collections.enabled" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.newtabpage.activity-stream.discoverystream.essentialReadsHeader.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "extensions.pocket.showHome" = false;
        "extensions.pocket.enabled" = false;
        "identity.fxaccounts.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
      };

      search = {
        default = "DuckDuckGo";
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
        };
      };
    };
  };
}
