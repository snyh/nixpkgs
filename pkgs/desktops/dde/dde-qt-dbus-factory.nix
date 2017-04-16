{ stdenv, unzip, fetchFromGitHub, pkgconfig, qt5, python27 }:

stdenv.mkDerivation rec {
  name = "dde-qt-dbus-factory-${version}";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "dde-qt-dbus-factory";
    rev = version;
    sha256 = "12z44li9hc0f7qnym1wlfq1vi48qkb5pcnz2qfl7bmrrwyvf69wd";
  };

  nativeBuildInputs = [ unzip pkgconfig qt5.qmakeHook qt5.qtbase python27 ];

  enableParallelBuilding = true;

  patches = [ ./patchs/fix_dframeworkdbus.patch ];

  preConfigure = ''
    qmakeFlags="$qmakeFlags INSTALL_ROOT=$out"
  '';

  meta = {
    description = "Generate static dbus bindings for Golang and QML at build-time.";
    homepage = "https://github.com/linuxdeepin/dbus-factory";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
