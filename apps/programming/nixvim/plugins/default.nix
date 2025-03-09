{ ... }:

{
  imports = [
    ./telescope.nix
    ./harpoon.nix
    ./treesitter.nix
    ./undotree.nix
    ./fugitive.nix
    ./lsp.nix
    ./oil.nix
    ./packer.nix
  ];
  programs.nixvim.plugins = {
    mini = {
      enable = true;
      modules.icons.MiniIcons = "get()"; 
    };
    web-devicons.enable = true;
  };
}
