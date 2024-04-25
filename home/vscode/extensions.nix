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
          version = "2024.5.11021008";
          sha256 = "11mnnbdl7cqr18s2cvv2132rrq1f5zslnihp5i2jpa2awjak8wjj";
        };
        "ms-python"."vscode-pylance" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-pylance";
          publisher = "ms-python";
          version = "2024.4.104";
          sha256 = "1sym2v479sz2cj58qlza0pfkylnklvfazcx9kcpwlkgpjwq0vwky";
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
          version = "3.0.5";
          sha256 = "1cmkgi1i5c7qkrr8cif36i803yl6mrv87y9gmzfb701pcfg8yxx9";
        };
        "ms-python"."isort" = vscode-utils.extensionFromVscodeMarketplace {
          name = "isort";
          publisher = "ms-python";
          version = "2023.13.10681007";
          sha256 = "134cljivnpba8h27xwa6dww1majp5jrgljyij1jng32rmi7ylzlp";
        };
        "ms-vscode-remote"."remote-ssh" = vscode-utils.extensionFromVscodeMarketplace {
          name = "remote-ssh";
          publisher = "ms-vscode-remote";
          version = "0.111.2024040515";
          sha256 = "0dd47p60y29g1xcq4ip9l0p53klzf0kf0brr3cq8l7ymfpf2vxg7";
        };
        "ms-vsliveshare"."vsliveshare" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vsliveshare";
          publisher = "ms-vsliveshare";
          version = "1.0.5918";
          sha256 = "1m4mpy6irj3vzjw6mzmjjp6appgf000zfhmkjwxw65sl4wmjckaf";
        };
        "dracula-theme"."theme-dracula" = vscode-utils.extensionFromVscodeMarketplace {
          name = "theme-dracula";
          publisher = "dracula-theme";
          version = "2.24.3";
          sha256 = "1gg9wrjz6w2khr1h449fwap34w1ydkndyi97r5bpbbdw9fa7q7fw";
        };
        "james-yu"."latex-workshop" = vscode-utils.extensionFromVscodeMarketplace {
          name = "latex-workshop";
          publisher = "james-yu";
          version = "9.20.0";
          sha256 = "140pyh5alx8nawnqg4bsj2x8hmffywn5v08zq09mm0asbds3ghf5";
        };
        "ms-python"."black-formatter" = vscode-utils.extensionFromVscodeMarketplace {
          name = "black-formatter";
          publisher = "ms-python";
          version = "2024.2.0";
          sha256 = "14w1ix8pm924piyw0dx2rq27cm5kmps9q99mkwrhi3ypliibx0x8";
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
          version = "3.37.0";
          sha256 = "0vbwcihw27vnlkfkrchqy1m9i1ivd4iv2rzb6kj0bq7kg0y2lh5h";
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
          version = "0.3.1";
          sha256 = "1cpfckh6zg8byi6x1llkdls24w9b0fvxx4qybi9zfcy5gc60r6nk";
        };
        "vscode-org-mode"."org-mode" = vscode-utils.extensionFromVscodeMarketplace {
          name = "org-mode";
          publisher = "vscode-org-mode";
          version = "1.0.0";
          sha256 = "1dp6mz1rb8awrrpig1j8y6nyln0186gkmrflfr8hahaqr668il53";
        };
        "arrterian"."nix-env-selector" = vscode-utils.extensionFromVscodeMarketplace {
          name = "nix-env-selector";
          publisher = "arrterian";
          version = "1.0.11";
          sha256 = "113zx78c3219knw4qa04242404n32vnk9rb6a3ynz41dgwh1mbbl";
        };
        "rubymaniac"."vscode-direnv" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-direnv";
          publisher = "rubymaniac";
          version = "0.0.2";
          sha256 = "1gml41bc77qlydnvk1rkaiv95rwprzqgj895kxllqy4ps8ly6nsd";
        };
        "jq-syntax-highlighting"."jq-syntax-highlighting" = vscode-utils.extensionFromVscodeMarketplace {
          name = "jq-syntax-highlighting";
          publisher = "jq-syntax-highlighting";
          version = "0.0.2";
          sha256 = "0q91mr6a6935wnka5iga97lv78g19dlj2rz6qg3ki6w3kdlvw2h7";
        };
        "lencerf"."beancount" = vscode-utils.extensionFromVscodeMarketplace {
          name = "beancount";
          publisher = "lencerf";
          version = "0.10.0";
          sha256 = "19nvjb2gff487al7vlhz0fgy8dwihqn00ragx6sqfzias2prihf6";
        };
        "gleam"."gleam" = vscode-utils.extensionFromVscodeMarketplace {
          name = "gleam";
          publisher = "gleam";
          version = "2.7.0";
          sha256 = "1zqysqc7dlbax21kydyhiq5zyfl292zx3457x1cy75q8zjzpmwmr";
        };
        "w4rh4wk"."souffle-syntax" = vscode-utils.extensionFromVscodeMarketplace {
          name = "souffle-syntax";
          publisher = "w4rh4wk";
          version = "0.1.0";
          sha256 = "0j3q1pfg4q0w4c4hf2hs7213zlg3g6n84drrbh2fy42azhzh757m";
        };
      }
        (lib.attrsets.optionalAttrs (isLinux && (isi686 || isx86_64)) {
          "ms-toolsai"."jupyter" = vscode-utils.extensionFromVscodeMarketplace {
            name = "jupyter";
            publisher = "ms-toolsai";
            version = "2024.4.2024041101";
            sha256 = "1r9jbhl12pn0xydv3q1vwfyvvcly4w5jkn6qa9ll0pv05larix97";
            arch = "linux-x64";
          };
        }))
      (lib.attrsets.optionalAttrs (isLinux && (isAarch32 || isAarch64)) {
        "ms-toolsai"."jupyter" = vscode-utils.extensionFromVscodeMarketplace {
          name = "jupyter";
          publisher = "ms-toolsai";
          version = "2024.4.2024041101";
          sha256 = "1qq7n9phnfz6dxlfcwvz70bv4470bi9zxpyn58my9p35f2mjl0b0";
          arch = "linux-arm64";
        };
      }))
    (lib.attrsets.optionalAttrs (isDarwin && (isi686 || isx86_64)) {
      "ms-toolsai"."jupyter" = vscode-utils.extensionFromVscodeMarketplace {
        name = "jupyter";
        publisher = "ms-toolsai";
        version = "2024.4.2024041101";
        sha256 = "1fvarldc3rx2qy5f9y4gxh55wrjg9ppxjks0mjfp2h6sf7r1xrwk";
        arch = "darwin-x64";
      };
    }))
  (lib.attrsets.optionalAttrs (isDarwin && (isAarch32 || isAarch64)) {
    "ms-toolsai"."jupyter" = vscode-utils.extensionFromVscodeMarketplace {
      name = "jupyter";
      publisher = "ms-toolsai";
      version = "2024.4.2024041101";
      sha256 = "1cxlp3q57dc5li1kkx82n27bv5bcvfl4gmksyrsxkxvig7z9jski";
      arch = "darwin-arm64";
    };
  })

