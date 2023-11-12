{ ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    prefix = "M-a";
    terminal = "tmux-256color";
    extraConfig = ''
      set -ga terminal-overrides ",*256col*:Tc"

      # Window splits
      bind '\' split-window -h
      bind - split-window -v

      # Moving between panes
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Switching windows
      bind -n S-Left previous-window
      bind -n S-Right next-window

      # Resizing panes
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # Statusline
      set -g status-left-length 20
      set -g status-right-length 50
      set -g status-style fg=colour0,bg=colour15
      setw -g window-status-current-style fg=colour7,bg=colour5
      setw -g message-style fg=colour15,bg=colour3

      # Reloading config
      bind r source-file ~/.config/tmux/tmux.conf \; display "Configuration reloaded!"
    '';
  };
}
