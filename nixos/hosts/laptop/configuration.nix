{ 
    pkgs, 
    lib,
    inputs,
    config,
    ...
}: let
    inherit (inputs) self;
    nixosModules = with self.nixosModules; [
        common
        fprint

        desktops.gnome
        desktops.niri
    ];
in {
    imports = [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ]
    ++ nixosModules;
  
    services.xserver.xkb = {
        layout = "es";
        variant = "";
    };

    # Configure console keymap
    console.keyMap = "es";

    networking.hostName = "zazalapbottom"; # Define your hostname.
    system.stateVersion = "25.05";
}
