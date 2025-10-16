{ config, pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.gnome.games.enable = false;

  # Remove fodder
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    gnome-console
    gnome-music
    gnome-software
    simple-scan
    totem
    epiphany
    geary
    yelp
    evince
    file-roller
  ];

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  environment.systemPackages = with pkgs; [
    # Themes
    adw-gtk3
    morewaita-icon-theme
    afterglow-cursors-recolored
    # Extra packages
    refine
    showtime
    papers
    gcolor3
    nautilus-python
    # Extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.forge
    gnomeExtensions.app-hider
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.hot-edge
    gnomeExtensions.middle-click-to-close-in-overview
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.week-start-modifier
    gnomeExtensions.window-title-is-back
    gnomeExtensions.rounded-corners
  ];

}
