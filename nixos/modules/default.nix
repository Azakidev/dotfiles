{ config, pkgs, ... }:

{
  imports = [
    ./core
    ./shell
    ./pkgs
  ];
}
