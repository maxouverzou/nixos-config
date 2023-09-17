{ pkgs, lib }:

let
  vscode-utils = pkgs.vscode-utils;
in
{
  ms-python.python = vscode-utils.extensionFromVscodeMarketplace {
    name = "python";
    publisher = "ms-python";
    version = "2023.9.11461009";
    sha256 = "1s4y5nwd9ajir4c7mviqy1qvn52s020fn2jfx4p1709ib24v3w73";
  };
  ms-python.vscode-pylance = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-pylance";
    publisher = "ms-python";
    version = "2023.9.12";
    sha256 = "1ny5ikkbyfcgbnpd52vb7r2xsby2anqkkwlrqzvza4zi669qmrnq";
  };
  esbenp.prettier-vscode = vscode-utils.extensionFromVscodeMarketplace {
    name = "prettier-vscode";
    publisher = "esbenp";
    version = "10.1.0";
    sha256 = "01s0vi2h917mqfpdrhqhp2ijwkibw95yk2js0l587wvajbbry2s9";
  };
  dbaeumer.vscode-eslint = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-eslint";
    publisher = "dbaeumer";
    version = "2.4.2";
    sha256 = "1g5mavks3m4fnn7wav659rdnd9f3lp7r96g8niad4g1vaj4xm23q";
  };
  eamodio.gitlens = vscode-utils.extensionFromVscodeMarketplace {
    name = "gitlens";
    publisher = "eamodio";
    version = "2023.8.2605";
    sha256 = "1kb2d6sadamq85wv26nd1g6ri2mhm562wcf036pky8ffw2lrsx1r";
  };
  ms-python.isort = vscode-utils.extensionFromVscodeMarketplace {
    name = "isort";
    publisher = "ms-python";
    version = "2023.11.12061012";
    sha256 = "0xmjm8rqma52amwlw9a0cs1pki0gnpafss9s2my3lasfnw1s1b8r";
  };
  redhat.vscode-yaml = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-yaml";
    publisher = "redhat";
    version = "1.14.0";
    sha256 = "0pww9qndd2vsizsibjsvscz9fbfx8srrj67x4vhmwr581q674944";
  };
  tamasfe.even-better-toml = vscode-utils.extensionFromVscodeMarketplace {
    name = "even-better-toml";
    publisher = "tamasfe";
    version = "0.19.2";
    sha256 = "0q9z98i446cc8bw1h1mvrddn3dnpnm2gwmzwv2s3fxdni2ggma14";
  };
  coolbear.systemd-unit-file = vscode-utils.extensionFromVscodeMarketplace {
    name = "systemd-unit-file";
    publisher = "coolbear";
    version = "1.0.6";
    sha256 = "0sc0zsdnxi4wfdlmaqwb6k2qc21dgwx6ipvri36x7agk7m8m4736";
  };
}
