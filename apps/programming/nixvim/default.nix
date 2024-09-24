{ ... }:

{
  imports = [
    ./plugins
    ./config
  ];

  programs.nixvim.enable = true;
}
