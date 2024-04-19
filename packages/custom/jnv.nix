{ lib, fetchFromGitHub, rustPlatform }:
# https://news.ycombinator.com/item?id=39759325
rustPlatform.buildRustPackage rec {
  pname = "jnv";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "ynqa";
    repo = pname;
    rev = version;
    hash = "sha256-eKCYxe7lPxsW9p+1Fi1KsNH2yn+jfKHHDcaT/Oszlgw=";
  };

  cargoHash = "sha256-jtBw4ahSl88L0iuCXxQgZVm1EcboWRJMNtjxLVTtzts=";

  meta = with lib; {
    description = "Interactive command-line JSON processor based on JQ";
    homepage = "https://github.com/ynqa/jnv";
    license = licenses.mit;
    maintainers = [ ];
  };
}
