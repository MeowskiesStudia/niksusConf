{ pkgs, ... }:

let
  layan-cursors = import ./theme/layan-cursor.nix { inherit pkgs; };
in
{
  #qt = {
  #  enable = true;
  #  platformTheme.name = "gtk";
  #  style = {
  #    name = "adwaita-dark";
  #    package = pkgs.adwaita-qt;
  #  };
  #};

  #home.pointerCursor = {
  #  gtk.enable = true;
  #  package = layan-cursors;
  #  name = "layan-cursors";
  #  size = 16;
  #};

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    image = ../../../home/soulcee/Pictures/Wallpapers/wp4.jpg;
  };
}
