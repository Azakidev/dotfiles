{ pkgs, ... }:

{
    programs= {
        steam.enable = true;
        gamemode.enable = true;
    };
    
    users.users.zazag = {
        packages = with pkgs; [
            heroic
        ];
    };
}
