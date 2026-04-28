{ inputs, ... }:
let
    inherit (inputs) self;

    nixosModules = with self.nixosModules; [
        core
        nh
        
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

    programs.nix-ld.enable = true;

    # Misc  
    nixpkgs.config.allowUnfree = true;
    services.flatpak.enable = true;

    nixpkgs.config.permittedInsecurePackages = [
        "electron-38.8.4"
    ];
}
