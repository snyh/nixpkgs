{ stdenv, fetchFromGitHub,
  qt5, pkgconfig,
  startup-notification, dtksettings, gsettings-qt,
}:

stdenv.mkDerivation rec {
  name = "deepin-tool-kit-${version}";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "deepin-tool-kit";
    rev = version;
    sha256 = "0zms0pc9sabfrrc5hzfgdp73b2q83mdhy7nzq8ij4nycz6s0cc4i";
  };

  nativeBuildInputs = [ pkgconfig qt5.qtbase qt5.qmakeHook startup-notification dtksettings gsettings-qt ];
  buildInputs = [ qt5.qttools qt5.qtmultimedia qt5.qtx11extras ];
  enableParallelBuilding = true;

  meta = {
    homepage = "https://github.com/linuxdeepin/deepin-tool-kit";
    description = "The base devlopment tool of all C++/Qt Developer work on Deepin";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
