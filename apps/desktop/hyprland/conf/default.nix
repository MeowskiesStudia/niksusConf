{ pkgs, inputs, config, lib, ... }:

let
  mod = "SUPER";
  term = "${pkgs.alacritty}/bin/alacritty";
  web = "${pkgs.firefox}/bin/firefox";
  file = "${pkgs.dolphin}/bin/dolphin";
  dmenu = "${pkgs.fuzzel}/bin/fuzzel";
in
{
  nixpkgs.overlays = [ (final: prev: pkgs.mesa) ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    settings = {
      monitor = ",preferred,2560x1440@165,auto";

      exec-once = "nm-applet";

      general = {
        gaps_in = 3;
        gaps_out = 6;

        border_size = 3;

        "col.active_border" = "rgba(A000DDFF)";
        "col.inactive_border" = "rgba(500077FF)";

        resize_on_border = false;

        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 20;

        active_opacity = 0.95;
        inactive_opacity = 0.75;

        blur = {
          enabled = true;
          size = 1;
          passes = 3;

          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = "yes, please :)";

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 3;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "de";
        kb_variant = "nodeadkeys";

        follow_mouse = 1;

        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      bind = [
        "${mod}, t, exec, ${term}"
        "${mod}, w, exec, ${web}"
        "${mod}, f, exec, ${file}"
        "${mod}_SHIFT, r, exec, ${dmenu}"


        "${mod}, x, killactive"


        "${mod}_SHIFT, e, exit"
        "${mod}, v, togglefloating"
        "${mod}, h, movefocus, l"
        "${mod}, l, movefocus, r"
        "${mod}, j, movefocus, d"
        "${mod}, k, movefocus, u"

        "${mod}, 1, workspace, 1"
        "${mod}, 2, workspace, 2"
        "${mod}, 3, workspace, 3"
        "${mod}, 4, workspace, 4"
        "${mod}, 5, workspace, 5"
        "${mod}, 6, workspace, 6"
        "${mod}, 7, workspace, 7"
        "${mod}, 8, workspace, 8"
        "${mod}, 9, workspace, 9"
        "${mod}, 10, workspace, 10"
      ];

      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];
    };
  };
}
