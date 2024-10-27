{ pkgs, ... }:

let
  layan-cursors = import ./theme/layan-cursor.nix { inherit pkgs; };
in
{
  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  gtk = {
    enable = true;
    cursorTheme.package = layan-cursors;
    cursorTheme.name = "layan-cursors";
  };
}
