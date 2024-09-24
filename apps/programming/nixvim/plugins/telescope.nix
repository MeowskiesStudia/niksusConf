{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>pf".action = "find_files";
      "<C-p>".action = "git_files";
    };
  };
}
