{ stdenv, fetchFromGitHub,
  qt5, pkgconfig,
  startup-notification, dtksettings,
}:

stdenv.mkDerivation rec {
  name = "deepin-tool-kit-${version}";
  version = "0.2.9";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "deepin-tool-kit";
    rev = version;
    sha256 = "15ijcqq8a4r404d646cnc1fp3gs8z2vxzwpd70p9i62krnnwmysc";
  };

  nativeBuildInputs = [ pkgconfig qt5.qtbase qt5.qmakeHook startup-notification dtksettings ];
  buildInputs = [ qt5.qttools qt5.qtmultimedia qt5.qtx11extras ];

  enableParallelBuilding = true;

  meta = {
    homepage = "https://github.com/linuxdeepin/deepin-tool-kit";
    description = "The base devlopment tool of all C++/Qt Developer work on Deepin";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
