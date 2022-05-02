{ config, pkgs, ... }:

let
  customNeovim = import ./nvim/nvim.nix;
  customDwm = import ./dwm/dwm.nix;
  customZsh = import ./zsh/zsh.nix;
  packages = import ./packages.nix;

in
  {
    # Programs 
    programs.neovim = customNeovim pkgs;
    programs.zsh = customZsh pkgs;
    programs.git = {
      enable = true;
      userName = "Learkedins";
      userEmail = "learkedins@gmail.com";
    };
    programs.gpg = {
      enable = true;
    };
    
    home.username = "fs";
    home.homeDirectory = "/home/fs";

    home.stateVersion = "21.11";

    programs.home-manager.enable = true;

    nixpkgs.overlays = [
      (import (builtins.fetchTarball {
        url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
      }))
    ];
  }
