{ config, pkgs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit=10;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Zram
  zramSwap.enable = true;
  zramSwap.algorithm = "lz4";

  # Enable networking
  networking.networkmanager.enable = true;

  # Firewall
  networking.firewall.allowedTCPPorts = [ 53317 8384 22000 9300 8080 3000 ];
  networking.firewall.allowedUDPPorts = [ 53317 8384 22000 9300 8080 3000 ];
  networking.firewall.enable = false;
  networking.nftables.enable = true;

  # User definition
  users.users.zazag = {
    isNormalUser = true;
    description = "zazag";
    extraGroups = [ "networkmanager" "wheel" "kvm" "input" ];
  };

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Enable ROCm 
  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa.opencl # Enables Rusticl (OpenCL) support
      rocmPackages.clr.icd
    ];
  };

  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];

}
