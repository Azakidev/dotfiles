{ pkgs, ... }:

{
    # Trigger the sound when the charger is plugged in or unplugged
    services.udev.extraRules = ''
        ACTION=="change", SUBSYSTEM=="power_supply", ENV{POWER_SUPPLY_ONLINE}=="0", RUN+="/usr/bin/env canberra-gtk-play -i power-unplug"
        ACTION=="change", SUBSYSTEM=="power_supply", ENV{POWER_SUPPLY_ONLINE}=="1", RUN+="/usr/bin/env canberra-gtk-play -i power-plug"
    '';
}
