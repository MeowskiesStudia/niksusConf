{ inputs, ... }:

{
  imports = [
    #./games
    ./desktop
    ./general
    ./programming
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    users.soulcee = {
      imports = [ ./home.nix ];
    };
  };
}
