{ inputs, pkgs, lib, ... }:

{
  #imports = [ inputs.minecraft.nixosModules.minecraft-servers ];
  #nixpkgs.overlays = [ inputs.minecraft.overlay ];

  services.minecraft-server = {
    enable = true;
    eula = true;

    serverProperties = {
      gamemode = "survival";
      difficulty = "hard";
    };

    jvmOpts = "-Xms4092M -Xmx4092M -XX +UseG1GC";
    
    package = pkgs.minecraft-server-1-12;
  };
}
