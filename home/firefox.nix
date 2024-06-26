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

        steam-database
        greasemonkey
        # user-agent switcher and manager?
      ];

      settings = {
        "browser.sessionstore.warnOnQuit" = true;
        "browser.startup.page" = 3 /* restore session */;

        # Enable DNS-over-HTTPS
        "network.trr.mode" = 2 /* on with native fallback */;
        "network.trr.excluded-domains" = "home.arpa";

        "identity.fxaccounts.enabled" = true;

        "browser.newtabpage.activity-stream.discoverystream.enabled" = true;
        "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = true;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

        "browser.newtabpage.activity-stream.discoverystream.editorsPicksHeader.enabled" = false;
        "browser.newtabpage.activity-stream.discoverystream.newSponsoredLabel.enabled" = false;
        "browser.newtabpage.activity-stream.discoverystream.sponsored-collections.enabled" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.newtabpage.activity-stream.discoverystream.essentialReadsHeader.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "extensions.pocket.showHome" = false;
        "extensions.pocket.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
      };

      userContent = ''
        @-moz-document domain(lemmy.today) {
          container-lg { max-width: 100% !important; }
        }
      '';

      search = {
        default = "DuckDuckGo";
        force = true;
        engines = {
          "HomeManager Options" = {
            urls = [{
              template = "https://home-manager-options.extranix.com/";
              params = [
                { name = "release"; value = "master"; }
                { name = "query"; value = "{searchTerms}"; }
              ];

            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@ho" ];
          };

          "NixOS Options" = {
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                { name = "channel"; value = "unstable"; }
                { name = "query"; value = "{searchTerms}"; }
                { name = "type"; value = "packages"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };

          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "channel"; value = "unstable"; }
                { name = "query"; value = "{searchTerms}"; }
                { name = "type"; value = "packages"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          "Wayback Machine" = {
            urls = [{
              template = "https://web.archive.org/web/*/%S";
            }];
            definedAliases = [ "@wm" ];
            iconUpdateURL = "https://web-static.archive.org/_static/images/archive.ico";
            updateInterval = 24 * 60 * 60 * 1000;
          };

          "DevDocs" = {
            urls = [{
              template = "https://devdocs.io/#q={searchTerms}";
            }];
            definedAliases = [ "@dd" ];
            iconUpdateURL = "https://devdocs.io/favicon.ico";
            updateInterval = 24 * 60 * 60 * 1000;
          };
        };
      };
    };
  };
}
