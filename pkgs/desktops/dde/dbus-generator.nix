{ stdenv, unzip, fetchFromGitHub, pkgconfig, go, dde-go-lib }:

stdenv.mkDerivation rec {
  name = "dde-dbus-generator-${version}";
  version = "0.6.5";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "go-dbus-generator";
    rev = version;
    sha256 = "118srgrnz7sl07bwrmi02c2c9iqfayj14sl5vjvkkz2c7gf5ivgb";
  };

  nativeBuildInputs = [ unzip pkgconfig go dde-go-lib ];

  buildPhase = ''
     export GOPATH=$GOPATH:${dde-go-lib.outPath}/share/gocode
     make
  '';

  installPhase = ''
     mkdir -p $out/bin
     cp dbus-generator $out/bin
  '';

  meta = {
    description = "A static dbus binding tool which support golang and QML";
    homepage = "https://github.com/linuxdeepin/go-dbus-generator";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
