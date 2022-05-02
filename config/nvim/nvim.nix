{ pkgs, config, ... }:

{
  enable = true;
  vimAlias = true;
  extraConfig = ''
    luafile $HOME/.config/nixos/config/nvim/opts.lua
    luafile $HOME/.config/nixos/config/nvim/treesitter.lua
    source $HOME/.config/nixos/config/nvim/nord.vim
  '';

  plugins = with pkgs.vimPlugins; [
    nvim-treesitter
  ];
}
