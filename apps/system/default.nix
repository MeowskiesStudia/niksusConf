{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    (uutils-coreutils.override { prefix = ""; })
  ];
}
