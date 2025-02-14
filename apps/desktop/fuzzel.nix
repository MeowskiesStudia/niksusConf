{ pkgs, ... }:

{
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main = {
      terminal = "${pkgs.alacritty}/bin/alacritty";
      layer = "overlay";
      hide-before-typing = true;
      match-mode = "fzf";
      placeholder = "pipish väl’pashv";

      anchor = "top-left";
      x-margin = 6;
      y-margin = 20;
    };
    #colors = {
    #  background = "303030ff";
    #  text = "ffffffff";
    #  input = "ffffffff";
    #  match = "b900ffff";
    #  selection = "3a3a3aff";
    #  selection-match = "b900ffff";
    #  selection-text = "a0a0a0ff";
    #  border = "2c2c2cff";
    #};
    border = {
      width = 3;
      radius = 20;
    };
  };
}
