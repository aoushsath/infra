{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      nvim-autopairs
      nvim-lspconfig
      nvim-treesitter
      telescope-nvim
      lush-nvim
      gruvbox
    ];
    extraPackages = with pkgs; [
      gopls
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
