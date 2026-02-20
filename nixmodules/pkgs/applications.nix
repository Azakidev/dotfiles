{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;

  virtualisation.waydroid.enable = true;

  programs.gamemode.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };


  users.users.zazag = {
    packages = with pkgs; [
      thunderbird
      resources
      localsend
      obsidian
      krita

      heroic

      discord
      betterdiscordctl
      beeper

      android-studio
      httptoolkit
      # Fonts
      corefonts
      vista-fonts
    ];
  };

  fonts.fontDir.enable = true;

  programs.steam = {
    enable = true;
  };

  services.syncthing = {
    enable = true;
    user = "zazag";
    dataDir = "/home/zazag/";
  };

}
