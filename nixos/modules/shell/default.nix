{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./theme.nix
    ./gnome.nix
  ];
}

