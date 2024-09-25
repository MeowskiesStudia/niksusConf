{ config, lib, pkgs, ... }:

let
  super = "Mod4";
  terminal = "${pkgs.alacritty}/bin/alacritty";
in
{
  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    #checkConfig = false;

    #extraConfig = ''
    #  corner_radius 20
    #  gaps outer 6
    #  gaps inner 3
    #'';

    #config = {
    #  modifier = super;
    #  input = {
    #    "type:keyboard" = {
    #      xkb_layout = "de";
    #      xkb_variant = "nodeadkeys";
    #    };
    #  };
    #  keybindings = {
    #    "--to-code ${super}+Return" = "exec ${terminal}";
    #  };
    #};

    #gaps = {
    #  outer = 6;
    #  inner = 3;
    #};

    #window = {
    #  titlebar = false;
    #};
  };
}
