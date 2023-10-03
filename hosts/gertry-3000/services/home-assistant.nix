{
  services.home-assistant = {
    enable = true;
    extraComponents = [
      # Components required to complete the onboarding
      "esphome"
      "met"
      "radio_browser"

      # Components detected at startup
      "upnp"
      "netgear"
      "homekit_controller"
      "thread"
      "apple_tv"
      "synology_dsm"

      "hue"
      "emulated_hue"
      "tplink"
      "nest"
      "ring"
    ];
    config = {
      # Includes dependencies for a basic setup
      # https://www.home-assistant.io/integrations/default_config/
      default_config = {};
    };
  };
}