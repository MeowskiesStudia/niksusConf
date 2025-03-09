{ ... }:

{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        nixd.enable = true;
        omnisharp.enable = true;
        java_language_server.enable = true;
        clangd.enable = true;
	glsl_analyzer.enable = true;
      };
    };
    plugins.cmp = {
      autoEnableSources = true;
    };
  };
}
