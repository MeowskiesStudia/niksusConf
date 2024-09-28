{ pkgs, ... }:

{
  imports = [
    #./alacritty.nix
  ];
  environment.systemPackages = with pkgs; [
    firefox
    spotify
    libreoffice
    gparted
  ];
}
