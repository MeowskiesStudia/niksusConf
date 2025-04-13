{ ... }:

{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
	key = "<F6>";
	action = "<cmd>CompilerOpen<CR>";
      }
      {
	key = "<C-F>";
	action = "<cmd>Oil<CR>";
      }
    ];
  };
}
