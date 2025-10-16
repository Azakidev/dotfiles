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
      eza
      zoxide
      bat
      ripgrep
      jq
      oh-my-posh
    ];
  };

}
