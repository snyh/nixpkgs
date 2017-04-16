{ stdenv, unzip, fetchFromGitHub, pkgconfig, dde-dbus-generator, go }:

stdenv.mkDerivation rec {
  name = "go-dde-dbus-factory-${version}";
  version = "3.1.4";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "dbus-factory";
    rev = version;
    sha256 = "19q3hjag7r53valh76lfkpsjhjn049l65yzhycz726h653rk0kmf";
  };

  nativeBuildInputs = [ unzip pkgconfig dde-dbus-generator go ];

  enableParallelBuilding = true;

  buildPhase = ''
    make build-golang
  '';

  installPhase = ''
    mkdir -p $out/share/go/src/dbus
    cp -rf in.json/go/src/dbus/* $out/share/go/src/dbus/
  '';

  meta = {
    description = "Generate static dbus bindings for Golang and QML at build-time.";
    homepage = "https://github.com/linuxdeepin/dbus-factory";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
