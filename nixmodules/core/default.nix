{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
    ./fprint.nix
    ./zram.nix
    ./networking.nix
  ];
}

