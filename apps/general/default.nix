{ pkgs, ... }:

{
  imports = [
    #./alacritty.nix
  ];
  environment.systemPackages = with pkgs; [
    firefox
    spotify
    libreoffice
    gparted
    btrfs-progs
    virt-manager
    OVMF
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
