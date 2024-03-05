{ pkgs, lib }:

let
  vscode-utils = pkgs.vscode-utils;
in
{
  "ms-python"."python" = vscode-utils.extensionFromVscodeMarketplace {
    name = "python";
    publisher = "ms-python";
    version = "2024.3.10660538";
    sha256 = "01fxlg46c0swniz9dva98s4z83qk4rx1w7swxq3h10i9c2kh2c4x";
  };
  "ms-python"."vscode-pylance" = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-pylance";
    publisher = "ms-python";
    version = "2024.2.105";
    sha256 = "0iyz05nbkfmpn564axnd2fi1a4h15nr9yq3lzrxyd6zd7wk5ax73";
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
  "ms-python"."isort" = vscode-utils.extensionFromVscodeMarketplace {
    name = "isort";
    publisher = "ms-python";
    version = "2023.13.10531006";
    sha256 = "0dbik155q4v9m9xypayshnxa3skrask2fybkgdya2kvsag0cwspj";
  };
  "ms-vsliveshare"."vsliveshare" = vscode-utils.extensionFromVscodeMarketplace {
    name = "vsliveshare";
    publisher = "ms-vsliveshare";
    version = "1.0.5918";
    sha256 = "1m4mpy6irj3vzjw6mzmjjp6appgf000zfhmkjwxw65sl4wmjckaf";
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
  "denoland"."vscode-deno" = vscode-utils.extensionFromVscodeMarketplace {
    name = "vscode-deno";
    publisher = "denoland";
    version = "3.33.3";
    sha256 = "039yj1c9w42w3nwg00ab4kjwxzznscq481rkbjw5mi094cfmh1lk";
  };
  "jakebecker"."elixir-ls" = vscode-utils.extensionFromVscodeMarketplace {
    name = "elixir-ls";
    publisher = "jakebecker";
    version = "0.20.0";
    sha256 = "1qap15kxcqmmp0qb8mq5k1s15gvmcsa26c8krhgg20zk3h2hvrm7";
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
  "jnoortheen"."nix-ide" = vscode-utils.extensionFromVscodeMarketplace {
    name = "nix-ide";
    publisher = "jnoortheen";
    version = "0.2.2";
    sha256 = "1264027sjh9a112si0y0p3pk3y36shj5b4qkpsj207z7lbxqq0wg";
  };
  "vscode-org-mode"."org-mode" = vscode-utils.extensionFromVscodeMarketplace {
    name = "org-mode";
    publisher = "vscode-org-mode";
    version = "1.0.0";
    sha256 = "1dp6mz1rb8awrrpig1j8y6nyln0186gkmrflfr8hahaqr668il53";
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
  "jq-syntax-highlighting"."jq-syntax-highlighting" = vscode-utils.extensionFromVscodeMarketplace {
    name = "jq-syntax-highlighting";
    publisher = "jq-syntax-highlighting";
    version = "0.0.2";
    sha256 = "0q91mr6a6935wnka5iga97lv78g19dlj2rz6qg3ki6w3kdlvw2h7";
  };
  "gleam"."gleam" = vscode-utils.extensionFromVscodeMarketplace {
    name = "gleam";
    publisher = "gleam";
    version = "2.5.1";
    sha256 = "19w84zyapfj6ha0gzffmbsbnl575aqbsfhpvvwchkxzqx8jlh0j5";
  };
  "w4rh4wk"."souffle-syntax" = vscode-utils.extensionFromVscodeMarketplace {
    name = "souffle-syntax";
    publisher = "w4rh4wk";
    version = "0.1.0";
    sha256 = "0j3q1pfg4q0w4c4hf2hs7213zlg3g6n84drrbh2fy42azhzh757m";
  };
}

