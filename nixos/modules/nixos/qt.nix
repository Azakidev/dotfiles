{ pkgs, ... }:

{
    users.users.zazag = {
        packages = with pkgs; [
            qt6Packages.qt6ct
            kdePackages.breeze-icons
            kdePackages.qtstyleplugin-kvantum
        ];

    };

    nixpkgs.config.qt6 = {
        platformTheme = "qt6ct";
    };

}
