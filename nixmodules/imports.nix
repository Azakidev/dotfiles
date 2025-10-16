{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./applications.nix
    ./terminal.nix
  ];
}
