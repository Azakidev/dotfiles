{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;

  programs.nix-ld.enable = true;
  programs.adb.enable = true;
  services.udev.packages = with pkgs; [
    android-udev-rules
  ];

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
      davinci-resolve

      discord
      betterdiscordctl
      beeper

      android-studio
      # androidenv.androidPkgs.platform-tools # Already included by programs.adb.enable
      httptoolkit
    ];
  };

  programs.steam = {
    enable = true;
  };
}
