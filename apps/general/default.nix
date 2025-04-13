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
    floorp
    vivaldi
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
    unzip
    grim
    slurp
    xfce.thunar
    ark
    p7zip
  ];
  fonts.packages = with pkgs; [ nerdfonts ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
