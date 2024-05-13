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
          version = "2024.5.100";
          sha256 = "05lccr0mmccvf0mk0q36rxyd9znp29p6brgcnnz648zygi3l1bm8";
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
        "eamodio"."gitlens" = vscode-utils.extensionFromVscodeMarketplace {
          name = "gitlens";
          publisher = "eamodio";
          version = "2024.5.1305";
          sha256 = "0rz9llzqdlqdbhfizisl844qxlrif7vj0d25cd9p44cw3c5ww2sw";
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
        "yzhang"."markdown-all-in-one" = vscode-utils.extensionFromVscodeMarketplace {
          name = "markdown-all-in-one";
          publisher = "yzhang";
          version = "3.6.2";
          sha256 = "1n9d3qh7vypcsfygfr5rif9krhykbmbcgf41mcjwgjrf899f11h4";
        };
        "dracula-theme"."theme-dracula" = vscode-utils.extensionFromVscodeMarketplace {
          name = "theme-dracula";
          publisher = "dracula-theme";
          version = "2.24.3";
          sha256 = "1gg9wrjz6w2khr1h449fwap34w1ydkndyi97r5bpbbdw9fa7q7fw";
        };
        "alefragnani"."project-manager" = vscode-utils.extensionFromVscodeMarketplace {
          name = "project-manager";
          publisher = "alefragnani";
          version = "12.8.0";
          sha256 = "1gp2dd4xm5a4dmaikcng79mfcb8a24mddsdwpgg4bqshcz4q7n5h";
        };
        "gruntfuggly"."todo-tree" = vscode-utils.extensionFromVscodeMarketplace {
          name = "todo-tree";
          publisher = "gruntfuggly";
          version = "0.0.226";
          sha256 = "0yrc9qbdk7zznd823bqs1g6n2i5xrda0f9a7349kknj9wp1mqgqn";
        };
        "james-yu"."latex-workshop" = vscode-utils.extensionFromVscodeMarketplace {
          name = "latex-workshop";
          publisher = "james-yu";
          version = "9.20.1";
          sha256 = "084m2wh8qf871bskjnbkinqpx2nj5r74g5rnwibvc7qzgr1r8fx5";
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
        "bierner"."markdown-mermaid" = vscode-utils.extensionFromVscodeMarketplace {
          name = "markdown-mermaid";
          publisher = "bierner";
          version = "1.23.0";
          sha256 = "0azf61v4gm4izb4s83bjxnfnnglnql6w5mxjf8pkq38wr56k31sc";
        };
        "tamasfe"."even-better-toml" = vscode-utils.extensionFromVscodeMarketplace {
          name = "even-better-toml";
          publisher = "tamasfe";
          version = "0.19.2";
          sha256 = "0q9z98i446cc8bw1h1mvrddn3dnpnm2gwmzwv2s3fxdni2ggma14";
        };
        "bierner"."markdown-emoji" = vscode-utils.extensionFromVscodeMarketplace {
          name = "markdown-emoji";
          publisher = "bierner";
          version = "0.3.0";
          sha256 = "0llmgk3rwcslqfnqp7xgvrqjqly3hvisahzmi0p49wn0w0fky3xg";
        };
        "denoland"."vscode-deno" = vscode-utils.extensionFromVscodeMarketplace {
          name = "vscode-deno";
          publisher = "denoland";
          version = "3.37.1";
          sha256 = "1xvk1pdsfmryypfmq8x03pwdm5fgwcqa8ziqvm53zbalq1rcx6hl";
        };
        "bierner"."emojisense" = vscode-utils.extensionFromVscodeMarketplace {
          name = "emojisense";
          publisher = "bierner";
          version = "0.10.0";
          sha256 = "14rb8licb32rh04g7lq73lmfx4pk2p4x63427l3s9fw9idsiwgrw";
        };
        "jakebecker"."elixir-ls" = vscode-utils.extensionFromVscodeMarketplace {
          name = "elixir-ls";
          publisher = "jakebecker";
          version = "0.21.1";
          sha256 = "1calkmix6hiaf31a0fblynykjwwnyn5bazcy8qd4g874g35a3wfg";
        };
        "bierner"."markdown-footnotes" = vscode-utils.extensionFromVscodeMarketplace {
          name = "markdown-footnotes";
          publisher = "bierner";
          version = "0.1.1";
          sha256 = "1pp64x8cn4vmpscmzv2dg6bakjhnwd36rms2wl6bs5laq29k5wl7";
        };
        "bpruitt-goddard"."mermaid-markdown-syntax-highlighting" = vscode-utils.extensionFromVscodeMarketplace {
          name = "mermaid-markdown-syntax-highlighting";
          publisher = "bpruitt-goddard";
          version = "1.6.3";
          sha256 = "1pa5d5fvi8dgf025lfkicfza8bvnbpripc1rfncnd2fajxbbpdl6";
        };
        "coolbear"."systemd-unit-file" = vscode-utils.extensionFromVscodeMarketplace {
          name = "systemd-unit-file";
          publisher = "coolbear";
          version = "1.0.6";
          sha256 = "0sc0zsdnxi4wfdlmaqwb6k2qc21dgwx6ipvri36x7agk7m8m4736";
        };
        "foam"."foam-vscode" = vscode-utils.extensionFromVscodeMarketplace {
          name = "foam-vscode";
          publisher = "foam";
          version = "0.25.11";
          sha256 = "0g119534d712ddyfpbrz99da3hy218b0fa28l0qn713rpa3736ms";
        };
        "jebbs"."markdown-extended" = vscode-utils.extensionFromVscodeMarketplace {
          name = "markdown-extended";
          publisher = "jebbs";
          version = "1.1.4";
          sha256 = "0bkncpkc04n96r8wfm34fhasyp51li4bv6x02bd0d5prb116prn5";
        };
        "sanaajani"."taskrunnercode" = vscode-utils.extensionFromVscodeMarketplace {
          name = "taskrunnercode";
          publisher = "sanaajani";
          version = "0.3.0";
          sha256 = "1sx50iawvkd93fv8m1vx28z4kr8sbk4rjkb8156qd6d0vcrqql9m";
        };
        "philipbe"."theme-gray-matter" = vscode-utils.extensionFromVscodeMarketplace {
          name = "theme-gray-matter";
          publisher = "philipbe";
          version = "1.7.0";
          sha256 = "0m6d36j1q0qlq1wxfgjrlb86cmx1m213zkrzq3znj0g46d7vwwhd";
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
          version = "0.11.0";
          sha256 = "1qb2ffmnlscailhicip5gq6ap8saa9hr3mfc3s4vcg9knv2bw81n";
        };
        "gleam"."gleam" = vscode-utils.extensionFromVscodeMarketplace {
          name = "gleam";
          publisher = "gleam";
          version = "2.9.0";
          sha256 = "0n6a03a0rq2j9y3r73i71s0nawk9j43m6zv57aibsvm0vqbh6yyn";
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

