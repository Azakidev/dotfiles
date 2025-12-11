{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  users.users.zazag = {
    shell = pkgs.zsh;
    packages = with pkgs; [
      # The basics
      ghostty
      gh
      oh-my-posh
      # Fonts
      fira-code
      meslo-lgs-nf
      # Utilities
      eza
      zoxide
      bat
      ripgrep
      fzf
      tealdeer
      unzip
      tree
      # CLIs
      jq
      yq
    ];
  };


  environment.systemPackages = with pkgs; [
    # Essentials
    neovim
    git
    wget
    wl-clipboard
    ffmpeg-full
    # Programming languages
    gcc
    cargo
    rustc
    nodejs
    python313
    jdk
    cmake
    # Fprint stuff
    usbutils
    openssl
    opencv
  ];

}
