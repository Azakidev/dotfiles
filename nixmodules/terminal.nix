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
      # CLIs
      jq
      yq
      # Python packages
      python3Packages.jsonpath-ng
      python3Packages.xmltodict
      python3Packages.requests
    ];
  };


  environment.systemPackages = with pkgs; [
    # Essentials
    neovim
    git
    # Programming languages
    gcc
    cargo
    rustc
    nodejs
    python313
    cmake
    # Fprint stuff
    usbutils
    openssl
    opencv
  ];

}
