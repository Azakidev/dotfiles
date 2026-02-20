{
    inputs,
    pkgs,
    lib,
    ...
}:

{
    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.systemd-boot.configurationLimit=10;

    # Kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;
}
