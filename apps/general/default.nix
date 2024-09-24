{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
  ];
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
