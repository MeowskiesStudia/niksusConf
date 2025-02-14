{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = {
	#args = ["new-session"];
	program = "tmux";
      };
    };
  };
}
