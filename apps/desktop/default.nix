{ pkgs, ... }:

{
  imports = [
    #./alacritty.nix
    #./swayfx
  ];

  environment.systemPackages = with pkgs; [
    gdm
    kdePackages.plasma-desktop
    swayfx
    pipewire
    kdePackages.plasma-pa
    home-manager
    fish
    xfce.xfdesktop
    xfce.xfce4-panel
    xfce.xfce4-appfinder
    #wired
  ];

  programs.fish.enable = true;

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
