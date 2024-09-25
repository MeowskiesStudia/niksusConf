{ config, pkgs, ... }:

{
  imports = [

  ];

  environment.systemPackages = with pkgs; [
    kdePackages.plasma-desktop
    pipewire
    kdePackages.plasma-pa
    home-manager
    fish
  ];

  #programs.fish.enable = true;

  services = {
    displayManager.sddm.enable = true;
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
