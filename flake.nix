{
  description = "A very basic flake";

  inputs = {
    # nix
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    #nixpkgs.follows = "github:nixos/nixpkgs/nixos-24.11";
    #nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # personal
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    swww = {
      url = "github:LGFae/swww";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = { nixpkgs, ... } @inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      "x86_64-linux"
    ];

    flake = {
      nixosConfigurations.hand-niksus = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./configuration.nix
	  inputs.stylix.nixosModules.stylix
        ];
      };

      homeConfigurations = {
        "soulcee@hand-niksus" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          specialArgs = { inherit inputs; };
          modules = [
	    ./apps/home.nix
	    #inputs.stylix.homeManagerModules.stylix
	  ];
        };
      };
    };
  };
}
