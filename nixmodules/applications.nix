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

  environment.systemPackages = with pkgs; [
    distrobox
  ];

  users.users.zazag = {
    packages = with pkgs; [
      thunderbird
      resources
      localsend
      obsidian
      krita
      winboat

      davinci-resolve
      blender-hip
      heroic

      discord
      betterdiscordctl
      beeper

      android-studio
      httptoolkit
    ];
  };

  programs.steam = {
    enable = true;
  };

  services.syncthing = {
    enable = true;
    user = "zazag";
    dataDir = "/home/zazag/";
  };

}
