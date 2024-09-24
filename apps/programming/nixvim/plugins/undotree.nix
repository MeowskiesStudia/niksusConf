{ ... }:

{
  programs.nixvim.plugins.undotree = {
    enable = true;
    settings.keymaps = {
        "<leader>u".action = "<cmd>UndotreeToggle<CR>";
      };
  };
}
