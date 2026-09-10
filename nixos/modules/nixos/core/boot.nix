{
    inputs,
    pkgs,
    lib,
    ...
}:

{
    # Bootloader
    boot = {
        loader = {
            systemd-boot = {
                enable = true;
                configurationLimit=10;
            };

            efi.canTouchEfiVariables = true;
        };


        plymouth = {
            enable = true;
            theme = "spinner_alt";
            themePackages = with pkgs; [
                (adi1090x-plymouth-themes.override {
                 selected_themes = [ "spinner_alt" ];
                 })
            ];
        };

        # Kernel
        kernelPackages = pkgs.linuxPackages_latest;

        kernelParams = lib.mkBefore [
            "fbcon=nodefer"                 # Wipes the vendor logo earlier
            "vt.global_cursor_default=0"    # Stops cursor blinking while booting
            "quiet"                         # Less log messages
            "systemd.show_status=auto"      # Only show systemd errors
            "udev.log_level=3"              # Only show udev errors
            "plymouth.use-simpledrm"        # Faster plymouth splash
            "splash"                        # Show splash
        ];

        consoleLogLevel = 3;

        initrd = {
            verbose = false;                # Less stage1 messages
            systemd.enable = true;          # Use systemd initrd
        };

        loader.timeout = 1;
    };
}
