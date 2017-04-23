{ stdenv, fetchFromGitHub,
  qt5, pkgconfig,
  deepin-tool-kit, libXtst,
}:

stdenv.mkDerivation rec {
  name = "dde-dock-${version}";
  version = "4.2.1";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "dde-dock";
    rev = version;
    sha256 = "0kpia9v9k6w00vhjcwckbflsfvgb4blf8mfgkvhn5jx7qsgjiibf";
  };

  outputs = [ "out" "dev" ];
  patches = [ ./patchs/fix_dde-dock.patch ];

  nativeBuildInputs = [ pkgconfig qt5.qtbase qt5.qmakeHook ];
  buildInputs = [ qt5.qttools qt5.qtmultimedia qt5.qtx11extras deepin-tool-kit libXtst ];

  preConfigure = ''
    qmakeFlags="$qmakeFlags INSTALL_ROOT=$out"
  '';

  enableParallelBuilding = true;

  meta = {
    homepage = "https://github.com/linuxdeepin/dde-dock";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
