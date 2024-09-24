{ ... }:

{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        nixd.enable = true;
        omnisharp.enable = true;
        java-language-server.enable = true;
        clangd.enable = true;
      };
    };
    plugins.cmp = {
      autoEnableSources = true;
    };
  };
}
