{ inputs, pkgs, ... }:

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
    greetd.tuigreet
    hyprpolkitagent
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  #programs.hyprpolkitagent.enable = true;

  services = {
    #greetd = {
    #  enable = true;
    #  settings = {
	#default_session = {
	#  command = "${pkgs.greetd.tuigreet}/bin/tuigreet --sessions ${pkgs.hyprland}/bin/hyprland --remember --remember-user-session";
	#};
      #};
    #};
    #displayManager.sessionPackages = [ pkgs.sway ];
    #desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    #libinput.mouse = {
    #  accelProfile = "custom";
    #  accelPointsMotion = [
    #    0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9
    #    1.0
    #  ];
    #  accelStepMotion = 4.0;
    #};

    xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
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
