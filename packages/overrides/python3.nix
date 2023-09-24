{ python3, fetchFromGitHub, ... }:
python3.override {
  packageOverrides = pself: psuper: {
    pyicloud = psuper.pyicloud.overrideAttrs (attrs: {
      src = fetchFromGitHub {
        owner = "maxouverzou";
        repo = "pyicloud";
        rev = "33952a924682f237a05409beb99dc29a7ff1d885";
        hash = "sha256-bLSYRzeR1ka+xFV29Mp97PwD3086XDODlXdcbPHKkEo=";
      };
    });
  };
}
