{ config, pkgs, ... }:

{
    imports = [
        ./applications.nix
        ./terminal.nix
    ];
}
