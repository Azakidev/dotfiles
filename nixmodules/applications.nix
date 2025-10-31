{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;

  virtualisation.waydroid.enable = true;

  # services.udev.packages = with pkgs; [
  #   android-udev-rules
  # ];

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
      davinci-resolve
      blender-hip

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
