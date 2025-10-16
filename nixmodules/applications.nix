{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      (pkgs.runCommand "steamrun-lib" { } "mkdir $out; ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib")
    ];
  };

  services.flatpak.enable = true;

  programs.adb.enable = true;
  services.udev.packages = with pkgs; [
    android-udev-rules
  ];

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
