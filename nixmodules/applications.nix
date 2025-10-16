{ config, pkgs, ... }:

{

  programs.firefox.enable = false;

  services.flatpak.enable = true;

  services.syncthing = {
    enable = true;
    user = "zazag";
    dataDir = "/home/zazag/";
  };

  users.users.zazag = {
    packages = with pkgs; [
      thunderbird
      resources
      
      localsend
      
      obsidian
      krita

      discord
      betterdiscordctl
      beeper

      android-studio
      androidenv.androidPkgs.platform-tools
    ];
  };

  programs.steam = {
    enable = true;
  };
}
