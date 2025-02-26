{ pkgs, inputs, system, ... }:

{
  imports = [
    #./alacritty.nix
    #./tmux.nix
    ../../theme.nix
  ];

  #nixpkgs.overlays = [
  #  (self: super: {
  #    uns = inputs.nixpkgs-unstable;
  #  })
  #];

  environment.systemPackages = with pkgs; [
    firefox
    floorp
    spotify
    alacritty
    gparted
    btrfs-progs
    obsidian
    vlc
    unrar-free
    btop
    mesa
    appimage-run
    tmux
    unzip
    scrot
    grim
    slurp
    xfce.thunar
    ark
    amdvlk
  ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
