{ pkgs, ... }:

{
  #extraPlugins = [ pkgs.vimPlugins.rose-pine ];

  programs.nixvim.colorschemes.rose-pine = {
    enable = true;
    settings.variant = "moon";
  };
}
