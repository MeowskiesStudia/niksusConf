{ inputs, config, pkgs, ... }:

{
  imports = [
  ];

  environment.systemPackages = with pkgs; [
    pipewire
    home-manager
    fish
    #start
    inputs.swww.packages.${pkgs.system}.swww
    fuzzel
    eww
    dunst
    pavucontrol
    #end
    xwaylandvideobridge
    obs-studio
    openrazer-daemon
    networkmanagerapplet
    thunderbird
    iamb
    element-desktop
    greetd.tuigreet
    hyprpolkitagent
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  #programs.hyprpolkitagent.enable = true;

  services = {
    greetd = {
      enable = true;
      settings = {
	default_session = {
	  command = "${pkgs.greetd.tuigreet}/bin/tuigreet --sessions ${pkgs.hyprland}/bin/hyprland --remember --remember-user-session";
	};
      };
    };
    #displayManager.sessionPackages = [ pkgs.sway ];
    #desktopManager.plasma6.enable = true;

    xserver = {
      enable = true;
      xkb = {
	layout = "de";
	variant = "nodeadkeys";
      };
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
  xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.common.default = "gtk";
    };
}
