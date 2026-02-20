{ config, pkgs, ... }:

{
  services.displayManager.gdm.enable = true;

  # Screen rotation
  hardware.sensor.iio.enable = true;

  environment.systemPackages = with pkgs; [
    # Extra packages
    refine
    showtime
    gnome-tweaks
    papers
    gcolor3
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
}
