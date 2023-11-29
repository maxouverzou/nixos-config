{ pkgs, config, ... }:
{
  programs.tmux = {
    enable = true;
    # shortcut = "a";
    baseIndex = 1;
    newSession = true;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];

    extraConfig = ''
      set -g default-terminal "xterm-256color"
      # Mouse works as expected
      set-option -g mouse on
    '';
  };

  programs.tmate = {
    enable = true;
    # FIXME: This causes tmate to hang.
    # extraConfig = config.xdg.configFile."tmux/tmux.conf".text;
  };
}
