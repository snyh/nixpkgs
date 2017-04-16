{ stdenv, unzip, fetchFromGitHub,
  glib, gtk2, qt5,
  gsettings-qt, pkgconfig, pam, deepin-tool-kit, dde-qt-dbus-factory, lightdm_qt,
}:

stdenv.mkDerivation rec {
  name = "dde-session-ui-${version}";
  version = "4.0.6";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "dde-session-ui";
    rev = version;
    sha256 = "0cf9nvij1h3czrprh5366335b5kaxqmawap5qff2dbdmn3l2kvv7";
  };

  nativeBuildInputs = [ unzip pkgconfig
    qt5.qmakeHook qt5.qtbase qt5.qtx11extras qt5.qttools qt5.qtmultimedia
    glib gtk2 gsettings-qt pam deepin-tool-kit dde-qt-dbus-factory lightdm_qt
  ];

  installFlags = [ "INSTALL_ROOT=$(out)" ];
  enableParallelBuilding = true;

  meta = {
    homepage = "https://github.com/linuxdeepin/dde-session-ui";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
