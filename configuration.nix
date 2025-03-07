{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./apps
      #./Servers #to be looked into further
    ];

  # Bootloader
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 25;
    };
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "hand-niksus";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  programs.fish.enable = true;
  programs.nix-ld.enable = true;
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.soulcee = import ./apps/home.nix;
  };
  users = {
    users.soulcee = {
      isNormalUser = true;
      description = "Morgan";
      extraGroups = [ "networkmanager" "wheel" "openrazer" ];
    };
    defaultUserShell = pkgs.fish;
  };
  security.polkit.enable = true;

  # Allow unfree packages
  nixpkgs.config = {
    permittedInsecurePackages = [ "dotnet-core-combined" "dotnet-sdk-6.0.428" "dotnet-sdk-wrapped-6.0.428" "dotnet-runtime-6.0.36" ];
    allowUnfree = true;
    allowBroken = true;
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "osu-lazer" ];
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than +5";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
  environment.sessionVariables.NIXOS_OZONE_WL=1;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
