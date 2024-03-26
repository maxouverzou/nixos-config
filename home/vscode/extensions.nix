{ pkgs, lib }:

let
  inherit (pkgs.stdenv) isDarwin isLinux isi686 isx86_64 isAarch32 isAarch64;
  vscode-utils = pkgs.vscode-utils;
  merge = lib.attrsets.recursiveUpdate;
in
merge
  (merge
    (merge
      (merge
      {
        "ms-python"."python" = vscode-utils.extensionFromVscodeMarketplace {
          name = "python";
          publisher = "ms-python";
          version = "2024.3.10861011";
          sha256 = "1wh5l2gcbg18n3a1k9bmshmjrzbnw060lyv3ms48lbd2symyqx3r";
        };
        "ms-python"."vscode-pylance" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-pylance";
          publisher = "ms-python";
          version = "2024.3.101";
          sha256 = "1vbh7a47gk7vgkv6vccl7pgwlgr4g2mj1z2zxj03g5ma6nm316bz";
        };
        "esbenp"."prettier-vscode" = vscode-utils.extensionFromVscodeMarketplace {
          name = "prettier-vscode";
          publisher = "esbenp";
          version = "10.4.0";
          sha256 = "1iy7i0yxnhizz40llnc1dk9q8kk98rz6ki830sq7zj3ak9qp9vzk";
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
          version = "2023.13.10681007";
          sha256 = "134cljivnpba8h27xwa6dww1majp5jrgljyij1jng32rmi7ylzlp";
        };
        "ms-vsliveshare"."vsliveshare" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vsliveshare";
          publisher = "ms-vsliveshare";
          version = "1.0.5918";
          sha256 = "1m4mpy6irj3vzjw6mzmjjp6appgf000zfhmkjwxw65sl4wmjckaf";
        };
        "james-yu"."latex-workshop" = vscode-utils.extensionFromVscodeMarketplace {
          name = "latex-workshop";
          publisher = "james-yu";
          version = "9.19.1";
          sha256 = "15k0kd12kkgsxgdr8rw3379gbgffdcxw6hb2fzsca9n32bkwym1i";
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
          version = "3.35.1";
          sha256 = "07sm905zjvazp4dfghzc7bcwqaiynaplhfi1k5xdgx09i4f4rgbf";
        };
        "jakebecker"."elixir-ls" = vscode-utils.extensionFromVscodeMarketplace {
          name = "elixir-ls";
          publisher = "jakebecker";
          version = "0.20.0";
          sha256 = "1qap15kxcqmmp0qb8mq5k1s15gvmcsa26c8krhgg20zk3h2hvrm7";
        };
        "mathematic"."vscode-latex" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-latex";
          publisher = "mathematic";
          version = "1.3.0";
          sha256 = "0iv50mand7ibs6ki21whhszg8bqn3c1gz3a1hy97j93xx6jwqrpy";
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
          version = "0.3.1";
          sha256 = "1cpfckh6zg8byi6x1llkdls24w9b0fvxx4qybi9zfcy5gc60r6nk";
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
          version = "2.6.0";
          sha256 = "078g7sakvscgqi03smgjbl2cxsgmiba7dsa5svi637dpxi7alz1z";
        };
        "w4rh4wk"."souffle-syntax" = vscode-utils.extensionFromVscodeMarketplace {
          name = "souffle-syntax";
          publisher = "w4rh4wk";
          version = "0.1.0";
          sha256 = "0j3q1pfg4q0w4c4hf2hs7213zlg3g6n84drrbh2fy42azhzh757m";
        };
      }
        (lib.attrsets.optionalAttrs (isLinux && (isi686 || isx86_64)) { }))
      (lib.attrsets.optionalAttrs (isLinux && (isAarch32 || isAarch64)) { }))
    (lib.attrsets.optionalAttrs (isDarwin && (isi686 || isx86_64)) { }))
  (lib.attrsets.optionalAttrs (isDarwin && (isAarch32 || isAarch64)) { })

