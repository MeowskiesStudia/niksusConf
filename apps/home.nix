{ config, pkgs, ... }:

{
  imports = [
    ./desktop/hyprland
    ./programming/git.nix
    #./desktop/swayfx
    ./desktop/fuzzel.nix
    #../theme.nix
    ./general/tmux.nix
    ./general/alacritty.nix
  ];
  home.username = "soulcee";
  home.homeDirectory = "/home/soulcee";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    swayfx
    discord
    #sonic-visualiser
    neofetch
    python312Packages.openrazer
    polychromatic
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/soulcee/etc/profile.d/hm-session-vars.sh
  #
  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
    };
    #todo to clarify what files are opened with
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };



  programs.home-manager.enable = true;
}

