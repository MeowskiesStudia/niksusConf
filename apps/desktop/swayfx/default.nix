{ config, lib, pkgs, ... }:

let
  super = "Mod4";
  terminal = "${pkgs.alacritty}/bin/alacritty";
  web = "${pkgs.firefox}/bin/firefox";
  file = "${pkgs.dolphin}/bin/dolphin";
in
{
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;

    extraConfig = ''
      # appearance
      corner_radius 20
      default_border pixel 3
      default_floating_border pixel 3
      blur enable
      blur_xray off
      blur_passes 2
      blur_radius 1
      shadows off
      shadows_on_csd off
      shadow_blur_radius 4
      shadow_color #0000007F
      default_dim_inactive 0.0
      dim_inactive_colors.unfocused #000000FF
      dim_inactive_colors.urgent #900000FF
    '';

    config = {
      # keys
      modifier = super;
      input = {
        "type:keyboard" = {
          xkb_layout = "de";
          xkb_variant = "nodeadkeys";
        };
      };
      keybindings = {
        floating.modifier = "${super}";
        # appstart
        "${super}+t" = "exec ${terminal}";
        "${super}+w" = "exec ${web}";
        "${super}+f" = "exec ${file}";
        # appinteract
        "${super}+a" = "focus parent";
        "${super}+Shift+v" = "floating toggle";
        modes.resize = {
          h = "resize shrink width 10px";
          j = "resize grow height 10px";
          k = "resize shrink height 10px";
          l = "resize grow width 10px";

          # exit resize
          Return = "mode default";
          Escape = "mode default";
        };
        "${super}+r" = "mode resize";
        "${super}+x" = "kill";
      };
      # appearance
      gaps = {
        outer = 6;
        inner = 3;
      };
      window = {
        titlebar = false;
      };
      colors = {
        focused = {
          border = "#000000";
          background = "#A000DD";
          text = "#000000";
        };
        focusedInactive = {
          border = "#000000";
          background = "#500077";
          text = "#000000";
        };
        unfocused = {
          border = "#000000";
          background = "#500077";
          text = "#000000";
        };
      };
      bars = {
        position = "top";
        statusCommand = "while date +'%Y-%m-%d %X'; do sleep 1; done";
        colors = {
          statusline = "#ffffff";
          background = "#100032cc";
          inactiveWorkspace = {
            background = "#32323200";
            border = "#32323200";
            text = "#5c5c5c";
          };
        };
      };
    };
  };
}
