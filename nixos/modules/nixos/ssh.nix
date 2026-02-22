{
    services.openssh.enable = true;

    programs.ssh = {
        extraConfig = "
            Host desktop
                Hostname 192.168.0.17
                Port 22
                User zazag
        ";
    };
}
