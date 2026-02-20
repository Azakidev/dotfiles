{ pkgs, ... }:

{
  virtualisation.waydroid.enable = true;
  
  users.users.zazag = {
    packages = with pkgs; [
      android-studio
      httptoolkit
    ];
  };

}
