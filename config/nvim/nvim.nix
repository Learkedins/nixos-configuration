{ pkgs, config, ... }:

{
  enable = true;
  vimAlias = true;
  extraConfig = ''
    luafile $HOME/.config/nixos/config/nvim/lua/opts.lua
    luafile $HOME/.config/nixos/config/nvim/lua/treesitter.lua
    source $HOME/.config/nixos/config/nvim/nord.vim
  '';

  plugins = with pkgs.vimPlugins; [
    nvim-treesitter
  ];
}
