{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    librewolf
    firefox
    spotify
    libreoffice
    sonic-visualiser
    discord
    neofetch
    polychromatic
  ];
}
