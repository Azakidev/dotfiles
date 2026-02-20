{ config, pkgs, ... }:

{
  # Enable networking
  networking.networkmanager.enable = true;
  
  networking.hostName = "zazalapbottom"; # Define your hostname.

  # Firewall
  networking.firewall.allowedTCPPorts = [ 53317 8384 22000 9300 8080 3000 ];
  networking.firewall.allowedUDPPorts = [ 53317 8384 22000 9300 8080 3000 ];
  networking.firewall.enable = false;
  networking.nftables.enable = true;
}
