{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "layan-cursors";

  src = pkgs.fetchurl {
    url = "https://github.com/vinceliuice/Layan-cursors/releases/.../pack.zip";
    sha256 = pkgs.lib.fakeSha256;
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    ${pkgs.unzip}/bin/unzip $src -d $out/
  '';
}
