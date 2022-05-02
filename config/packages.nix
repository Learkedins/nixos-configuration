{ pkgs, config, ... }:
{
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.permittedInsecurePackages = [
        "electron-13.6.9"
    ];
    # Install all the packages
    environment.systemPackages = with pkgs; [
        # Rice/desktop
        bemenu zsh dunst wl-clipboard swaybg sway brillo wlsunset 
      	home-manager nitrogen lxappearance scrot xclip pfetch

        # Command-line tools
        ripgrep ffmpeg tealdeer exa htop fzf
        pass gnupg slop bat unzip libnotify
        lowdown zk grim slurp imagemagick age

        # WINDOW MANAGER ESSENTIALS
        dmenu


        # GUI applications
        mpv brave firefox pqiv obsidian

        # Development
        git zig

        # Language servers for neovim; change these to whatever languages you code in
        # Please note: if you remove any of these, make sure to also remove them from nvim/config/nvim/lua/lsp.lua!!
        rnix-lsp
        sumneko-lua-language-server

        # DWM
        (dwm.overrideAttrs (oldAttrs: rec {
                            configFile = writeText "config.def.h" (builtins.readFile ./dwm/config.h);
                            postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
                            }))

        # ST
        (st.overrideAttrs (oldAttrs: rec {
                            configFile = writeText "config.def.h" (builtins.readFile ./st/config.h);
                            postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
                            }))

    ];
}

