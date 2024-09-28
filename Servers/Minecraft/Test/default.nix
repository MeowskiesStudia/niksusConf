{ inputs, ... }:

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers = {
      serv1 = {
        enable = true;
        serverProperties = {
          gamemode = "survival";
          difficulty = "easy";
          simulation-distance = 12;
        };
        jvmOpts = "-Xms4092M -Xmx4092M";
      };
    };
  };
}
