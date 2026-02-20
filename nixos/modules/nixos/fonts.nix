{ pkgs, ... }:

{
  users.users.zazag = {
    packages = with pkgs; [
      # Fonts
      corefonts
      vista-fonts
    ];
  };

  fonts.fontDir.enable = true;
}
