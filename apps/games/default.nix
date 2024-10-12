{ config, pkgs, inputs, ... }:

{
  imports = [
    #./legacypkgs.nix
  ];

  environment.systemPackages = with pkgs; [
    steam
    protonup-qt
    lutris
    prismlauncher
    minecraft
    r2modman
    ckan
    heroic
    flitter
  ];
  programs.steam.enable = true;
  services.flatpak.enable = true;
}
