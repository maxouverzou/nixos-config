{ pkgs, ... }: {

  services.avizo = {
    enable = true;
  };

  home.packages = with pkgs; [
    # TODO add brightnessctl?

    (writeScriptBin "xf86-audio-raise-volume" "${avizo}/bin/volumectl +5%")
    (writeScriptBin "xf86-audio-lower-volume" "${avizo}/bin/volumectl -5%")
    (writeScriptBin "xf86-audio-mute" "${avizo}/bin/volumectl toggle-mute")
    (writeScriptBin "xf86-audio-mic-mute" "${avizo}/bin/volumectl -m toggle-mute")

    (writeScriptBin "xf86-mon-brightness-down" "${avizo}/bin/lightctl -5%")
    (writeScriptBin "xf86-mon-brightness-up" "${avizo}/bin/lightctl +5%")
  ];
}
