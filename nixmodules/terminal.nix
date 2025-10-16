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
      ghostty
      oh-my-posh
      gh
      eza
      zoxide
      bat
      ripgrep
      jq
      yq
    ];
  };


  environment.systemPackages = with pkgs; [
    neovim
    git
    gcc
    cargo
    rustc
    nodejs
  ];

}
