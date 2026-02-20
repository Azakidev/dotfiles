{
    inputs,
    ...
}: let
    inherit (inputs) self;

    nixosModules = with self.nixosModules; [
        core
        
        fonts
        theme

        applications
        android
        terminal
        gaming
        syncthing
    ];

in {
    imports = nixosModules;

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    services.displayManager.gdm.enable = true;

    # Screen rotation
    hardware.sensor.iio.enable = true;

    # Misc  
    nixpkgs.config.allowUnfree = true;
    services.flatpak.enable = true;
}
