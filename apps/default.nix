{ inputs, ... }:

{
  imports = [
    ./games
    ./desktop
    ./general
    ./programming
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    user.soulcee = {
      imports = [ ./home.nix ];
    };
  };
}
