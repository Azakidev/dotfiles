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
            
            # Nautilus
            nautilus
            nautilus-python
            ffmpegthumbnailer
            ( # kra file thumbnailer
            writeTextFile {
                name = "krita-thumbnails";
                text = ''
                    [Thumbnailer Entry]
                    TryExec=unzip
                    Exec=sh -c "${pkgs.unzip}/bin/unzip -p %i preview.png > %o"
                    MimeType=application/x-krita;
                '';
                destination = "/share/thumbnailers/kra.thumbnailer";
            }
            )
        ];
    };
}
