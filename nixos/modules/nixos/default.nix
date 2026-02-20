{
    applications = import ./applications.nix;
    core = import ./core;
    common = import ./common.nix;
    desktops = import ./desktops;
    terminal = import ./terminal.nix;
    theme = import ./theme.nix;
    fonts = import ./fonts.nix;
    gaming = import ./gaming.nix;
    android = import ./android.nix;
    syncthing = import ./syncthing.nix;
    zen = import ./zen.nix;
}
