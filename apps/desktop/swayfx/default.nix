{ config, lib, pkgs, ... }:

let
  super = "Mod4";
  terminal = "${pkgs.alacritty}/bin/alacritty";
in
{
  wayland.windowManager.sway = {
    checkConfig = true;

    extraConfig = ''
      corner_radius 20
    '';

    config = {
      modifier = super;
      input = {
        "type:keyboard" = {
          xkb_layout = "de";
          xkb_variant = "nodeadkeys";
        };
      };
      keybindings = {
        "--to-code ${super}+Return" = "exec ${terminal}";
      };
      gaps = {
        outer = 6;
        inner = 3;
      };
      window = {
        titlebar = false;
      };
    };
  };
}
