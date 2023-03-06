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
}
