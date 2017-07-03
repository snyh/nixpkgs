{ stdenv, fetchFromGitHub,
  qt5, pkgconfig,
  startup-notification, dtksettings, gsettings-qt,
}:

stdenv.mkDerivation rec {
  name = "deepin-tool-kit-${version}";
  version = "0.2.11";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "deepin-tool-kit";
    rev = version;
    sha256 = "0p4cdxnnk4rch0wgyyykhqq38wz1si3hpmscdmjv45i37pvs3gvl";
  };

  nativeBuildInputs = [ pkgconfig qt5.qtbase qt5.qmakeHook startup-notification dtksettings gsettings-qt ];
  buildInputs = [ qt5.qttools qt5.qtmultimedia qt5.qtx11extras ];
  patches = [ ./patchs/dtkwidget.patch ];
  enableParallelBuilding = true;

  meta = {
    homepage = "https://github.com/linuxdeepin/deepin-tool-kit";
    description = "The base devlopment tool of all C++/Qt Developer work on Deepin";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
