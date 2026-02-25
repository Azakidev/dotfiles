{ pkgs, ... }:

{
  users.users.zazag = {
    packages = with pkgs; [
      # Terminal
      fira-code
      meslo-lgs-nf
      # Document
      corefonts
      vista-fonts
    ];
  };

  fonts.fontDir.enable = true;
}
