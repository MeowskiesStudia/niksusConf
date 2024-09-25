{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.nixosModules.nixvim
    ./nixvim
  ];

  environment.systemPackages = with pkgs; [
    dotnetCorePackages.sdk_9_0
    wget
    git
    gh
  ];
}
