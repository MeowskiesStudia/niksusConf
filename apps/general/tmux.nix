{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    terminal = "alacritty";
    extraConfig = ''
      set-option status off
      set-option -a terminal-overrides "alacritty:Tc"
    '';
  };
}
