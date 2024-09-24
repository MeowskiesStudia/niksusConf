{ ... }:

{
  imports = [
    ./telescope.nix
    ./harpoon.nix
    ./treesitter.nix
    ./undotree.nix
    ./fugitive.nix
    ./lsp.nix
  ];
  programs.nixvim.plugins = {
    web-devicons.enable = true;
  };
}
