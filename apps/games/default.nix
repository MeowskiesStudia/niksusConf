{ pkgs, ... }:

{
  imports = [
  ];

  environment.systemPackages = with pkgs; [
    steam
    scarab
    protonup-qt
    protontricks
    lutris
    prismlauncher
    r2modman
    ckan
    legendary-gl
    rare
    flitter
    vkquake
    pcsx2
  ];

  programs.steam.enable = true;
  services.flatpak.enable = true;
}
