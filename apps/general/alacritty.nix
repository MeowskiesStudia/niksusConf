{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    #settings = {
    #  terminal.shell = {
	#args = ["attach-session"];
	#program = "tmux";
    #  };
    #};
  };
}
