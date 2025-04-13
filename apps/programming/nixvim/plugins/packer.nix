{ ... }:

{
  programs.nixvim.plugins = {
    orgmode.enable = true;
    twilight = {
      enable = true;
      autoLoad = true;
    };
    todo-comments = {
      enable = true;
    };
    parinfer-rust.enable = true;
    compiler = {
      enable = true;
      #keymaps = {
	#"<F6>".action = "CompilerOpen";
	#"<F5>".action = "CompilerToggleResults";
      #};
    };
    colorizer.enable = true;
    autoclose.enable = true;
    blink-cmp = {
      enable = true;
    };
    friendly-snippets = {
      enable = true;
    };
    navic.enable = true;
    lualine = {
      enable = true;
      settings = {
	lualine_c = [
	  "navic"
	  "diff"
	];	
      };
    };
  };
}
