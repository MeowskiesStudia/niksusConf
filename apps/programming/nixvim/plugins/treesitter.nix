{ pkgs, ... }:

{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      markdown
      lua
      bash
      nix
      toml
      rust
      c_sharp
      cpp
      glsl
      fish
      git_config
      git_rebase
      gitattributes
      gitcommit
      gitignore
      gdscript
      #gdresource
      gdshader
      java
      norg
    ];
  };
}
