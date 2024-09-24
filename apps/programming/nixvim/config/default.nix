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

      shiftwidth = 2;
    };
  };
}
