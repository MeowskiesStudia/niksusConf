{config, lib, pkgs, ...}:

{
  configs.programs.alacritty = {
    settings = {
      shell.program = "/bin/fish";
    };
  };
}
