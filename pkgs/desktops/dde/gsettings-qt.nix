{
  stdenv, unzip, pkgconfig, fetchbzr, qt5, glib
}:

stdenv.mkDerivation rec {
  name = "gsettings-qt-${version}";
  version = "0.1.20151104";

  src = fetchbzr {
    url = "http://bazaar.launchpad.net/~system-settings-touch/gsettings-qt/trunk";
    rev = "75";
    sha256 = "09rjf2bh1wgbyghr7v5mykv7l08syxs0bsw8zxf0k99yna6gygn2";
  };

  buildInputs = [ qt5.qtdeclarative glib ];
  nativeBuildInputs = [ qt5.qmakeHook pkgconfig ];

  preConfigure = ''
    sed -i -e "s,\$\$\\[QT_INSTALL_LIBS\\],$out/lib," \
           -e "s,\$\$\\[QT_INSTALL_HEADERS\\],$out/include/," \
           -e "s,\$\$\\[QT_INSTALL_TRANSLATIONS\\],$out/share/qt/translations," \
           -e "s,\$\$\\[QT_INSTALL_DATA\\],$out/share/qt," \
           src/gsettings-qt.pro
  '';

  meta = {
    description = "Qml bindings for GSettings";
    homepage = "https://launchpad.net/gsettings-qt";
    license = stdenv.lib.licenses.gpl;
    platforms = stdenv.lib.platforms.linux;
  };
}
