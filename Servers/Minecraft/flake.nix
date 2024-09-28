{
   description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = { self, nixpkgs, minecraft, ... } @inputs: {
    system = "x86_64-linux";

    nixosConfigurations.hand-niksus = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./serverMaster
      ];
    };
  };
}
