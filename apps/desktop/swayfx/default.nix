{ pkgs, ... }:

let
  super = "Mod4";
  terminal = "${pkgs.alacritty}/bin/alacritty";
  web = "${pkgs.firefox}/bin/firefox";
  file = "${pkgs.dolphin}/bin/dolphin";
  dmenu = "${pkgs.fuzzel}/bin/fuzzel";
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
      startup = [
	{ command = "swww-daemon"; }
      ];
      # keys
      modifier = super;
      input = {
        "type:keyboard" = {
          xkb_layout = "de";
          xkb_variant = "nodeadkeys";
        };
      };
      floating.modifier = "${super}";
      keybindings = {
        # appstart
        "${super}+t" = "exec ${terminal}";
        "${super}+w" = "exec ${web}";
        "${super}+f" = "exec ${file}";
        "${super}+Shift+r" = "exec ${dmenu}";
        # appinteract
        "${super}+a" = "focus parent";
        "${super}+Shift+v" = "floating toggle";

        "${super}+r" = "mode resize";
        "${super}+x" = "kill";

	"${super}+1" = "workspace number 1";
	"${super}+2" = "workspace number 2";
	"${super}+3" = "workspace number 3";
	"${super}+4" = "workspace number 4";
	"${super}+5" = "workspace number 5";

	"${super}+Shift+1" = "move container to workspace number 1";
	"${super}+Shift+2" = "move container to workspace number 2";
	"${super}+Shift+3" = "move container to workspace number 3";

	"${super}+b" = "splith";
	"${super}+v" = "splitv";

        #logout
        "${super}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";
      };
      modes.resize = {
        h = "resize shrink width 10px";
        j = "resize grow height 10px";
        k = "resize shrink height 10px";
        l = "resize grow width 10px";

        # exit resize
        Return = "mode default";
        Escape = "mode default";
      };
      # appearance
      gaps = {
        outer = 6;
        inner = 3;
      };
      window = {
        titlebar = false;
	commands = [
	  {
	    command = "opacity 0.95";
	    criteria.con_id = "__focused__";
	  }
	  {
	    command = "opacity 0.75";
	    criteria.app_id = ".*";
	  }
	];
      };
      colors = {
        focused = {
          border = "#000000";
          background = "#FFFFFF";
          text = "#000000";
          childBorder = "#A000DD";
          indicator = "#000000";
        };
        focusedInactive = {
          border = "#000000";
          background = "#FFFFFF";
          text = "#000000";
          childBorder = "#500077";
          indicator = "#000000";
        };
        unfocused = {
          border = "#000000";
          background = "#FFFFFF";
          text = "#000000";
          childBorder = "#500077";
          indicator = "#000000";
        };
      };
      bars = [
        {
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
        }
      ];
    };
  };
}
