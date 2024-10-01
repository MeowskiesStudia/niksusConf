{ inputs, config, pkgs, ... }:

{
  imports = [
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.plasma-desktop
    pipewire
    kdePackages.plasma-pa
    home-manager
    fish
    gdm
    inputs.swww.packages.${pkgs.system}.swww
    fuzzel
  ];

  services = {
    xserver.displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };
    displayManager.sessionPackages = [ pkgs.sway ];
    desktopManager.plasma6.enable = true;

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
}
