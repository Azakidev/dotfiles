{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        adw-gtk3
        morewaita-icon-theme
        afterglow-cursors-recolored
    ];
}
