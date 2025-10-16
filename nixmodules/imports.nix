{ config, pkgs, ... }:

{
  imports = [
    ./base.nix
    ./shell.nix
    ./applications.nix
    ./terminal.nix
  ];
}
