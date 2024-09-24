{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    steam
    protonup-qt
    lutris
    prismlauncher
    minecraft
    r2modman
    ckan
    heroic
  ];
  programs.steam.enable = true;
}
