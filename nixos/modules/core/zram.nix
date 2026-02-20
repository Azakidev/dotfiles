{ config, pkgs, ... }:

{
  zramSwap.enable = true;
  zramSwap.algorithm = "lz4";
}
