{
    username,
    inputs,
    pkgs,
    ...
}:

{
    hardware.bluetooth.enable = true;

    services = {
        gvfs.enable = true;
        udisks2.enable = true;
        upower.enable = true;
        power-profiles-daemon.enable = true;
        accounts-daemon.enable = true;

        gnome = {
            evolution-data-server.enable = true;
            glib-networking.enable = true;
            gnome-keyring.enable = true;
            gnome-online-accounts.enable = true;
        };
    };

    environment.systemPackages = with pkgs; [
        gnome-disk-utility
        gnome-characters
        gnome-calculator
        xwayland-satellite
    ];

    programs = {
        niri.enable = true;

        dms-shell = {
            enable = true;
            enableVPN = false;

            quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
        };

        dsearch.enable = true;
    };
}
