{ pkgs, lib, ... }:

{
  #programs.nixvim.extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
  #  name = "due";
  #  src = pkgs.fetchzip {
  #    url = "https://github.com/nfrid/due.nvim/archive/refs/heads/main.zip";
  #    hash = null;
  #  };
  #})];
}
