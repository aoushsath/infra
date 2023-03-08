{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tosh";
  home.homeDirectory = "/home/tosh";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fzf
    ibm-plex
    ripgrep
    rustup
    trashy
    zola
  ];

  fonts.fontconfig.enable = true;

  # Git
  programs.git = {
    enable = true;
    userName = "Tosh";
    userEmail = "git@chaoticenginerd.com";
    aliases = {
      a = "add";
      c = "commit";
      l = "log --oneline --graph";
      p = "push";
      s = "status";
      df = "diff";
      sdf = "diff --staged";
    };
    signing = {
      key = "git@chaoticenginerd.com";
      signByDefault = true;
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  # Neovim
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      nvim-autopairs
      nvim-lspconfig
      nvim-treesitter
      telescope-nvim
    ];
    extraPackages = with pkgs; [
      nil
      nodePackages.pyright
      rust-analyzer
      sumneko-lua-language-server
    ];
    extraLuaConfig = ''
      ${ builtins.readFile ./nvim/init.lua }
    '';
  };

  # Tmux
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
      set -g status-style fg=colour0,bg=colour15
      setw -g window-status-current-style fg=colour7,bg=colour5
      setw -g message-style fg=colour15,bg=colour3

      # Reloading config
      bind r source-file ~/.config/tmux/tmux.conf \; display "Configuration reloaded!"
    '';
  };
}
