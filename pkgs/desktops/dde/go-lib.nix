{ stdenv, unzip, fetchFromGitHub, pkgconfig, glib, libpulseaudio, cmake, gettext, go }:

stdenv.mkDerivation rec {
  name = "dde-go-lib-${version}";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "go-lib";
    rev = version;
    sha256 = "0h5cdqqbycqwapwvhdkdx9ij8h2gw65w0k795ncff798imp0bi9a";
  };

  buildInputs = [ unzip glib pkgconfig gettext libpulseaudio go ];

  installPhase = ''
    mkdir -p $out/share/go/src/pkg.deepin.io/lib
    cp -r * $out/share/go/src/pkg.deepin.io/lib
  '';

  meta = {
    description = "This containing many useful go routines such as glib, gettext, archive, graphic, etc";
    homepage = "https://github.com/linuxdeepin/go-lib";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
