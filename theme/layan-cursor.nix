{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "layan-cursors";

  src = pkgs.fetchurl {
    url = "https://github.com/vinceliuice/Layan-cursors/archive/refs/tags/2021-08-01.zip";
    sha256 = "sha256-S1/sM4SYOzqY3yaQxXF23nJpYp+2AeWYTKzTU4GrRys=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip $src -d $out/
  '';
}
