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
    boot.kernelPackages = pkgs.linuxPackagesFor (
        pkgs.linux_latest.override {
            argsOverride = rec {
            version = "7.0.6";
            modDirVersion = "7.0.6";
            src = pkgs.fetchurl {
                url = "mirror://kernel/linux/kernel/v7.x/linux-${version}.tar.xz";
                sha256 = "08vm18wx6399phzgr3wz94yga3ab4fyca79445ygvbspm904996b";
                };
            };
        }
    );
}
