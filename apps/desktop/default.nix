{ config, pkgs, ... }:

{
  imports = [

  ];

  environment.systemPackages = with pkgs; [
    kdePackages.plasma-desktop
    pipewire
    kdePackages.plasma-pa
    home-manager
  ];

  programs.fish.enable = true;

  services = {
    displayManager = {
      sddm.enable = true;
      plasma6.enable = true;
    };

    xserver.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}
