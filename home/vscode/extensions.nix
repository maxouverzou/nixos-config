{ pkgs, lib }:

let
  vscode-utils = pkgs.vscode-utils;
in
{
  "ms-python"."python" = vscode-utils.extensionFromVscodeMarketplace {
    name = "python";
    publisher = "ms-python";
    version = "2023.25.10171013";
    sha256 = "09bkqg290wxm9pdv41b9bq27km9cqzg10wkxvhpz32hj0wc4h5ps";
  };

  "ms-python"."vscode-pylance" = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-pylance";
    publisher = "ms-python";
    version = "2023.12.103";
    sha256 = "1lkh94vyx9k23yw7i6sl1yy5f5wf3kjm8c5ljybzvy1lbi831lyf";
  };

  "ms-toolsai"."jupyter" = vscode-utils.extensionFromVscodeMarketplace {
    name = "jupyter";
    publisher = "ms-toolsai";
    version = "2023.11.1100101639";
    sha256 = "15d0s6y8y6sv9qkbr8gsry0d2l7km8j3r872mgra7ngj0anlb2zj";
  };

  "esbenp"."prettier-vscode" = vscode-utils.extensionFromVscodeMarketplace {
    name = "prettier-vscode";
    publisher = "esbenp";
    version = "10.1.0";
    sha256 = "01s0vi2h917mqfpdrhqhp2ijwkibw95yk2js0l587wvajbbry2s9";
  };

  "dbaeumer"."vscode-eslint" = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-eslint";
    publisher = "dbaeumer";
    version = "2.4.3";
    sha256 = "15i8ra8wjr3k5n0d5ji6spn8jxg34aikpn86p8gl6l5czxm78dv4";
  };

  "eamodio"."gitlens" = vscode-utils.extensionFromVscodeMarketplace {
    name = "gitlens";
    publisher = "eamodio";
    version = "2024.1.1704";
    sha256 = "0dv3hhhs9pahf11b8rfxl3na14ghyc715a9ri6xm5xhhsxmv7p31";
  };

  "ms-python"."isort" = vscode-utils.extensionFromVscodeMarketplace {
    name = "isort";
    publisher = "ms-python";
    version = "2023.11.13191009";
    sha256 = "03kji3kz4z6rqfy97zh76r3l5h6jnnmhhr6vf8hc688qd7gxpnwb";
  };

  "ms-vsliveshare"."vsliveshare" = vscode-utils.extensionFromVscodeMarketplace {
    name = "vsliveshare";
    publisher = "ms-vsliveshare";
    version = "1.0.5905";
    sha256 = "0xixyjlw45fg8mi0f3h2kn9x24qhvvmaah8p7syqdzyxlwxhqlyb";
  };

  "redhat"."vscode-yaml" = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-yaml";
    publisher = "redhat";
    version = "1.14.0";
    sha256 = "0pww9qndd2vsizsibjsvscz9fbfx8srrj67x4vhmwr581q674944";
  };

  "tamasfe"."even-better-toml" = vscode-utils.extensionFromVscodeMarketplace {
    name = "even-better-toml";
    publisher = "tamasfe";
    version = "0.19.2";
    sha256 = "0q9z98i446cc8bw1h1mvrddn3dnpnm2gwmzwv2s3fxdni2ggma14";
  };

  "coolbear"."systemd-unit-file" = vscode-utils.extensionFromVscodeMarketplace {
    name = "systemd-unit-file";
    publisher = "coolbear";
    version = "1.0.6";
    sha256 = "0sc0zsdnxi4wfdlmaqwb6k2qc21dgwx6ipvri36x7agk7m8m4736";
  };

  "sanaajani"."taskrunnercode" = vscode-utils.extensionFromVscodeMarketplace {
    name = "taskrunnercode";
    publisher = "sanaajani";
    version = "0.3.0";
    sha256 = "1sx50iawvkd93fv8m1vx28z4kr8sbk4rjkb8156qd6d0vcrqql9m";
  };

  "vscode-org-mode"."org-mode" = vscode-utils.extensionFromVscodeMarketplace {
    name = "org-mode";
    publisher = "vscode-org-mode";
    version = "1.0.0";
    sha256 = "1dp6mz1rb8awrrpig1j8y6nyln0186gkmrflfr8hahaqr668il53";
  };

  "jnoortheen"."nix-ide" = vscode-utils.extensionFromVscodeMarketplace {
    name = "nix-ide";
    publisher = "jnoortheen";
    version = "0.2.2";
    sha256 = "1264027sjh9a112si0y0p3pk3y36shj5b4qkpsj207z7lbxqq0wg";
  };

  "rubymaniac"."vscode-direnv" = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-direnv";
    publisher = "rubymaniac";
    version = "0.0.2";
    sha256 = "1gml41bc77qlydnvk1rkaiv95rwprzqgj895kxllqy4ps8ly6nsd";
  };

  "arrterian"."nix-env-selector" = vscode-utils.extensionFromVscodeMarketplace {
    name = "nix-env-selector";
    publisher = "arrterian";
    version = "1.0.10";
    sha256 = "0gx2w0z4ibr46g4yqllqmyff779r272pd73ajxh55n8lpk8snx3g";
  };

}

