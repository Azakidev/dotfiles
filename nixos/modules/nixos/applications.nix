{ pkgs, ... }:

{
    users.users.zazag = {
        packages = with pkgs; [
            thunderbird
            resources
            localsend
            obsidian
            krita

            # Chat
            discord
            stoat-desktop
            beeper
        
            #Extra packages
            showtime
            gnome-tweaks
            papers
            gcolor3
        ];
    };
}
