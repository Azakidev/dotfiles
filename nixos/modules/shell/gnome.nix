{ config, pkgs, ... }:

{
  services.desktopManager.gnome.enable = true;
  services.gnome.games.enable = false;

  # Xwayland
  services.xserver.enable = true;
  services.xserver.excludePackages = with pkgs; [
      xterm
  ];

  # Remove fodder
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    gnome-console
    gnome-music
    gnome-software
    simple-scan
    epiphany
    geary
    yelp
    evince
    file-roller
  ];

}
