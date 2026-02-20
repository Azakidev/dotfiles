{ username, ... }:

{
    services.syncthing = {
        enable = true;
        user = username;
        dataDir = "/home/${username}/";
    };
}
