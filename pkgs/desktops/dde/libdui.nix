{ stdenv, fetchFromGitHub,
  qt5, pkgconfig,
}:

stdenv.mkDerivation rec {
  name = "libdui-${version}";
  version = "1.2.10";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "libdui";
    rev = version;
    sha256 = "0arh4zjsksr5v91m9vvkz6y6c0917a42ilf1lz310ggx088m4va6";
  };

  nativeBuildInputs = [ pkgconfig qt5.qtbase qt5.qmakeHook ];
  buildInputs = [ qt5.qttools qt5.qtmultimedia qt5.qtx11extras ];

  enableParallelBuilding = true;


  patches = [ ./patchs/fix_libdui.patch ];
  preConfigure = ''
    qmakeFlags="$qmakeFlags INSTALL_ROOT=$out"
  '';

  meta = {
    homepage = "https://github.com/linuxdeepin/libdui";
    description = "The UI library for Deepin";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
