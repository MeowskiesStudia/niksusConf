{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gimp
    krita
  ];
}
