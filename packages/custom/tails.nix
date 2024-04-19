{ lib
, fetchurl
}:
let
  pname = "tails";
  version = "6.1";
in
fetchurl {
  name = "${pname}-${version}";
  url = "https://download.tails.net/tails/stable/${pname}-amd64-${version}/${pname}-amd64-${version}.iso";
  hash = "sha256-fxwTfqQTfLSkcmN7oH+e5q3X6nGuLJwXWgSpB4xQLbM=";

  meta = {
    description = "The Amnesic Incognito Live System (Tails) is a Debian-based live DVD/USB with the goal of providing complete Internet anonymity for the user";
    homepage = "https://tails.net/";
    license = lib.licenses.gpl3;
  };
}
