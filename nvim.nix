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

      lsp-zero-nvim
      nvim-cmp
      cmp-nvim-lsp
      luasnip
    ];
    extraPackages = with pkgs; [
      gopls
      nil
      nodePackages.pyright
      sumneko-lua-language-server
      zls
    ];
    extraLuaConfig = ''
      ${ builtins.readFile ./nvim/init.lua }
    '';
  };
}
