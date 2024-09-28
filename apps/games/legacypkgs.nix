{ pkgs, config, inputs, ... }:

let
  lgcypkgs = import <nixos-24.05> {};
in
{
  environment.systemPackages = with lgcypkgs; [
    grapejuice
  ];
}
