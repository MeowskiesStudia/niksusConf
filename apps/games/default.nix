{ pkgs, lib, ... }:

let
  xenia = pkgs.fetchFromGitHub {
    owner = "xenia-canary";
    repo = "xenia-canary";
    rev = "23d1f7a30880d9e2e3f210360d2219ac630fdff1";
    hash = "sha256-FQuzYlUu4w/RFbX80EgtaWjRWNhl1ousmRYDnKiQym8=";
  };
in
{
  imports = [
  ];

  environment.systemPackages = with pkgs; [
    steam
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
    libretro.pcsx-rearmed
    pcsx2
    rpcs3
    owmods-cli
    gamemode
    xenia
  ];
  
  programs.gamemode.enable = true;
  programs.steam.enable = true;
  services.flatpak.enable = true;
}
