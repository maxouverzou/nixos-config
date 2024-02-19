{ pkgs, lib }:

let
  vscode-utils = pkgs.vscode-utils;
in
{
  "ms-python"."python" = vscode-utils.extensionFromVscodeMarketplace {
    name = "python";
    publisher = "ms-python";
    version = "2024.1.10451007";
    sha256 = "1hjh1hyjy94lc6ivxqisfql95phfn8j8mfrjxaxnnq9yfaggwhd4";
  };

  "ms-python"."vscode-pylance" = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-pylance";
    publisher = "ms-python";
    version = "2024.2.101";
    sha256 = "0g6swds84qbrj3xjkhpm6wdl87hhysmxwp1n87gm4d90bn3rj3pq";
  };

  "ms-toolsai"."jupyter" = vscode-utils.extensionFromVscodeMarketplace {
    name = "jupyter";
    publisher = "ms-toolsai";
    version = "2024.1.2024012502";
    sha256 = "11dq86kxm3yqyykrv7xnq8nfim0jx16ni6hj75chbhsynvdjkb8x";
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
    version = "2.4.4";
    sha256 = "1c10n36a3bxwwjgd4vhrf79wg14dm0hxvz9z23pqdyxzcwrar49l";
  };

  "eamodio"."gitlens" = vscode-utils.extensionFromVscodeMarketplace {
    name = "gitlens";
    publisher = "eamodio";
    version = "2024.2.1804";
    sha256 = "09rhh6mahav8250y0v3w7nwn3nnkbh46xlsgimd0hs7smzqif6yn";
  };

  "ms-python"."isort" = vscode-utils.extensionFromVscodeMarketplace {
    name = "isort";
    publisher = "ms-python";
    version = "2023.13.10231012";
    sha256 = "1c8s02b89ixzmi1h4n97c7x8vl9wssxckyxml3aqgjbxn7kw8902";
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

  "github"."vscode-github-actions" = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-github-actions";
    publisher = "github";
    version = "0.26.2";
    sha256 = "16kp1yxs798jp8ffqq3ixm3pyz4f3wgdkdyjpjy94ppqp4aklixh";
  };

  "tamasfe"."even-better-toml" = vscode-utils.extensionFromVscodeMarketplace {
    name = "even-better-toml";
    publisher = "tamasfe";
    version = "0.19.2";
    sha256 = "0q9z98i446cc8bw1h1mvrddn3dnpnm2gwmzwv2s3fxdni2ggma14";
  };

  "jakebecker"."elixir-ls" = vscode-utils.extensionFromVscodeMarketplace {
    name = "elixir-ls";
    publisher = "jakebecker";
    version = "0.19.0";
    sha256 = "1rnwl8x7qjbn8zaqgs0x9pnnnamkv449i5an60vlcl4m2ff9wmyz";
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
    version = "1.0.11";
    sha256 = "113zx78c3219knw4qa04242404n32vnk9rb6a3ynz41dgwh1mbbl";
  };

  "gleam"."gleam" = vscode-utils.extensionFromVscodeMarketplace {
    name = "gleam";
    publisher = "gleam";
    version = "2.5.1";
    sha256 = "19w84zyapfj6ha0gzffmbsbnl575aqbsfhpvvwchkxzqx8jlh0j5";
  };
}
