{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.nixosModules.nixvim
    ./nixvim
  ];

  environment.systemPackages = with pkgs; [
    dotnetCorePackages.sdk_9_0
    python3
    wget
    git
    gh
    godot_4
    vulkan-helper
    kicad
  ];
}
