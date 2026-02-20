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

    desktops.gnome
  ];
in {
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ]
    ++ nixosModules;

  networking.hostName = "zazalapbottom"; # Define your hostname.
  system.stateVersion = "25.05";
}
