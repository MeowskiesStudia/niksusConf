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
    
    cursor.package = pkgs.oreo-cursors-plus;
    cursor.name = "oreo_purple_cursors";
    cursor.size = 12;

    fonts = {
      monospace = {
	package = pkgs.source-code-pro;
	name = "Source Code Pro";
      };
    };

    image = ./wp4.jpg;
  };
}
