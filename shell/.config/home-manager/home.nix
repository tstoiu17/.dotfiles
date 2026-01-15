{ config, pkgs, ... }:

{
  home.packages =
    with pkgs;
    builtins.concatLists [
      # LANG: C/C++
      # [
      #   libgcc
      # ]
      # LANG: haskell
      [
        haskellPackages.haskell-language-server
      ]
      # LANG: python
      [
        python313
        uv
        ruff
      ]
      # LANG: go
      [
        go
      ]
      # LANG: javascript
      [
        bun
        deno
        pnpm
        nodejs_22
        nodePackages.prettier
      ]
      # LANG: rust
      [
        cargo
      ]
      # LANG: rust
      [
        zig
      ]
      # LANG: lua
      [
        stylua
      ]
      # LANG: nix
      [
        nixd # lsp
        nixfmt-rfc-style # formatter
      ]
      # documents
      [
        typst
        pandoc
        texliveMedium
      ]
      # shell/cli
      [
        zsh
        zsh-syntax-highlighting
        bash
        fish
        bat
        eza
        starship
        fzf
        nnn
        stow
        tmux
        tmuxp
        xdg-utils
        direnv
        nix-direnv
        curl
        jq
        fx
        yq-go
        git
        lazygit
        delta
        gh
        unzip
        zip
        entr
        visidata
        sqlite
        helix
        docker
        just
        dust
        radare2
        gdb
        cgdb
        gef
        gemini-cli
        apktool
        android-tools
        jdk
        apksigner
        jadx
        hashcat
      ]
      # vim
      [
        vim
        neovim
        tree-sitter
        clang_18 # C compiler for treesitter
        ripgrep # for telescope
        fd # for telescope
      ]
    ];

  home.username = "test1";
  home.homeDirectory = "/home/test1";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
