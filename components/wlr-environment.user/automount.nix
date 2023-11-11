{ pkgs, ... }: {
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    settings = {
      # https://github.com/coldfix/udiskie/blob/master/doc/udiskie.8.txt#configuration
    };
  };

}
