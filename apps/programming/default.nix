{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.nixosModules.nixvim
    ./nixvim
    ./gitTemp.nix
  ];

  environment.systemPackages = with pkgs; [
    dotnetCorePackages.sdk_9_0
    wget
    #vim
    git
    gh
  ];
}
