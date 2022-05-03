{ pkgs, config, ... }:


{
  enable = true;
  vimAlias = true;
  extraConfig = ''
    luafile $HOME/.config/nixos/config/nvim/lua/opts.lua
    luafile $HOME/.config/nixos/config/nvim/lua/treesitter.lua
    luafile $HOME/.config/nixos/config/nvim/lua/lsp.lua
    luafile $HOME/.config/nixos/config/nvim/lua/dusk.lua
    luafile $HOME/.config/nixos/config/nvim/lua/cmp.lua
  '';



  plugins = with pkgs.vimPlugins; [
    # Syntax Highlighting
    nvim-treesitter

    # Completion
    nvim-lspconfig
    nvim-cmp
    cmp-cmdline
    cmp-path
    cmp-buffer
    cmp-nvim-lsp
    luasnip
    cmp_luasnip

    # Colorscheme
    nord-nvim
  ];
}
