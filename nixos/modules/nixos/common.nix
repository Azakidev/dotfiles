{ inputs, ... }:
let
    inherit (inputs) self;

    nixosModules = with self.nixosModules; [
        core
        
        fonts
        theme

        android
        applications
        terminal
        gaming
        nautilus
        syncthing
        ssh
        zen
    ];

in {
    imports = nixosModules;

    services.displayManager.gdm.enable = true;

    # Screen rotation
    hardware.sensor.iio.enable = true;

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Misc  
    nixpkgs.config.allowUnfree = true;
    services.flatpak.enable = true;
}
