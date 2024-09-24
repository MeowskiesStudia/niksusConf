{ ... }:

{
  programs.alacritty.settings = {
    keyboard.bindings = [
      {
	key = "C";
	mods = "Control";
	action = "Copy";
      }
      {
	key = "V";
	mods = "Control";
	action = "Paste";
      }
    ];
  };
}
