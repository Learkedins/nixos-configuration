pkgs:

{
  enable = true;

  dotDir = ".config/zsh";
  
  initExtra = ''
    PROMPT="%F{blue}%m %~%b "$'\n'"%(?.%F{green}%Bλ%b.%F{red}?) %f"
    export PATH=$NIXOS_CONFIG_DIR/scripts/:$PATH
    export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store";
    export ZK_NOTEBOOK_DIR="$HOME/stuff/notes";
    export EDITOR="nvim";
    export DIRENV_LOG_FORMAT="";
    bindkey '^ ' autosuggest-accept
    edir() { tar -cz $1 | age -p > $1.tar.gz.age && rm -rf $1 &>/dev/null && echo "$1 encrypted" }
    ddir() { age -d $1 | tar -xz && rm -rf $1 &>/dev/null && echo "$1 decrypted" }
  '';

  # Set some aliases
  shellAliases = {
    v = "nvim";
    vim = "nvim";
    nvim = "nvim -i NONE";
    c = "clear";
    mkdir = "mkdir -vp";
    rm = "rm -rifv";
    mv = "mv -iv";
    cp = "cp -riv";
    cat = "bat --paging=never --style=plain";
    ls = "exa -a --icons";
    tree = "exa --tree --icons";
    nd = "nix develop -c $SHELL";
  };

  # Source all plugins, nix-style
    plugins = [
    {
        name = "fast-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
            owner = "zdharma";
            repo = "fast-syntax-highlighting";
            rev = "817916dfa907d179f0d46d8de355e883cf67bd97";
            sha256 = "0m102makrfz1ibxq8rx77nngjyhdqrm8hsrr9342zzhq1nf4wxxc";
        };
    }
    {
        name = "auto-ls";
        src = pkgs.fetchFromGitHub {
            owner = "notusknot";
            repo = "auto-ls";
            rev = "62a176120b9deb81a8efec992d8d6ed99c2bd1a1";
            sha256 = "08wgs3sj7hy30x03m8j6lxns8r2kpjahb9wr0s0zyzrmr4xwccj0";
        };
    }
    {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "a411ef3e0992d4839f0732ebeb9823024afaaaa8";
            sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
        };
    }];
}
