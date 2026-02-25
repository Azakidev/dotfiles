{ pkgs, ... }:

{
    users.users.zazag = {
        packages = with pkgs; [
            nautilus
            nautilus-python
            # Thumbnailers
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
            ( # pxo file thumbnailer
            writeTextFile {
                name = "pixelorama-thumbnails";
                text = ''
                    [Thumbnailer Entry]
                    TryExec=unzip
                    Exec=sh -c "${pkgs.unzip}/bin/unzip -p %i preview.png > %o"
                    MimeType=image/pxo;
                '';
                destination = "/share/thumbnailers/pxo.thumbnailer";
            }
            )
        ];
    };
}
