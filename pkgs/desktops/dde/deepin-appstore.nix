{ stdenv, fetchFromGitHub,
  qt5, pkgconfig, cmake, libpthreadstubs,
  deepin-tool-kit, dde-qt5integration, libXdmcp,
}:

stdenv.mkDerivation rec {
  name = "deepin-appstore-${version}";
  version = "master";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "deepin-appstore";
    rev = version;
    sha256 = "1c9cz0w66z4kcdm5132yavkb29h6y19mxb784mvmj87hprx7a012";
  };

  nativeBuildInputs = [ cmake pkgconfig ];
  buildInputs = [
    qt5.qttools qt5.qtbase qt5.qtmultimedia qt5.qtx11extras qt5.qtwebkit
    libXdmcp libpthreadstubs
    deepin-tool-kit dde-qt5integration
  ];

  enableParallelBuilding = true;

  meta = {
    homepage = "https://github.com/linuxdeepin/deepin-appstore";
    description = "a quality app store with rich contents that supports 1-click download and installation";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
