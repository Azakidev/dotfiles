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
      oh-my-posh
      # Utilities
      eza
      zoxide
      bat
      ripgrep
      tealdeer
      # CLIs
      jq
      yq
      # Python packages
      python313Packages.jsonpath-ng
      python313Packages.xmltodict
    ];
  };


  environment.systemPackages = with pkgs; [
    # Essentials
    neovim
    git
    gh
    # Programming languages
    gcc
    cargo
    rustc
    nodejs
    python313
  ];

}
