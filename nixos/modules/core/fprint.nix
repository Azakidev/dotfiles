{ config, pkgs, ... }:

let
  customFprintRef = "github:oscar-schwarz/libfprint-goodix-55b4/b62173cdfe5097bdcb42b37d9448ca5bc3c1afbf";

  customFlakeOutputs = builtins.getFlake customFprintRef;

  goodixPkgs = customFlakeOutputs.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  environment.systemPackages = [
    goodixPkgs.default
    goodixPkgs.fprintd

    pkgs.usbutils
    pkgs.openssl
    pkgs.opencv
  ];

  services.fprintd = {
    enable = true;
    package = goodixPkgs.fprintd;
  };

}

