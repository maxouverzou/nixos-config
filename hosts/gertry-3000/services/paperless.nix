{ config, ... }: {
  sops.secrets = {
    PAPERLESS_ADMIN_PASSWORD = {
      mode = "0400";
      owner = config.services.paperless.user;
    };
  };

  services.paperless = {
    enable = true;
    address = "0.0.0.0";
    passwordFile = config.sops.secrets.PAPERLESS_ADMIN_PASSWORD.path;
  };

  sops.templates."paperless-backup.env" = {
    content = ''
      RESTIC_REPOSITORY=
      RESTIC_PASSWORD=
      AWS_ACCESS_KEY_ID=
      AWS_SECRET_ACCESS_KEY=
    '';
  };

  systemd.timers."paperless-backup" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "monthly";
      Unit = "paperless-backup.service";
    };
  };

  systemd."paperless-backup" = {
    serviceConfig = {
      WorkingDirectory = config.services.paperless.dataDir;
      ExecStart = "${pkgs.restic}/bin/restic backup . --skip-if-unchanged";
      EnvironmentFile = config.sops.templates."paperless-backup.env".path;
    }
      };
  }
