{ ... }:

{
  imports = [
    ./keymaps.nix
    ./colorscheme.nix
    ./bufferline.nix
  ];

  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      cmdheight = 0;

      shiftwidth = 2;
    };
    autoCmd = [
      {
	command = "Twilight";
	event = [ "VimEnter" ];
	pattern = "*";
      }
    ];
  };
}
