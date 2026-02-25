{
    android = import ./android.nix;
    applications = import ./applications.nix;
    core = import ./core;
    common = import ./common.nix;
    desktops = import ./desktops;
    terminal = import ./terminal.nix;
    theme = import ./theme.nix;
    fonts = import ./fonts.nix;
    fprint = import ./fprint.nix;
    gaming = import ./gaming.nix;
    nautilus = import ./nautilus.nix;
    ssh = import ./ssh.nix;
    syncthing = import ./syncthing.nix;
    zen = import ./zen.nix;
}
