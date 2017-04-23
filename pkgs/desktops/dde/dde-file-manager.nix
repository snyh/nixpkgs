{ stdenv, fetchFromGitHub,
  qt5, pkgconfig,
  deepin-tool-kit, libXtst, gtk2, gsettings-qt, libsecret,
  poppler, dtksettings, ffmpegthumbnailer, file, polkit-qt, dde-dock, polkit,
}:

stdenv.mkDerivation rec {
  name = "dde-file-manager-${version}";
  version = "4.1.5";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "dde-file-manager";
    rev = version;
    sha256 = "12209af94drzxmmbx6lg75ycyaa0dvc3zdq83m8wv7mvz70z4pbn";
  };

  nativeBuildInputs = [ pkgconfig qt5.qtbase qt5.qmakeHook ];
  buildInputs = [
    qt5.qttools qt5.qtmultimedia qt5.qtx11extras
    deepin-tool-kit libXtst gtk2 gsettings-qt libsecret poppler dtksettings
    ffmpegthumbnailer file polkit-qt dde-dock.dev polkit
  ];

  preConfigure = ''
    qmakeFlags="$qmakeFlags INSTALL_ROOT=$out INCLUDEPATH=${dde-dock.dev}/include/dde-dock/"
  '';

  enableParallelBuilding = true;

  meta = {
    homepage = "https://github.com/linuxdeepin/dde-dock";
    description = "A file management tool independently developed by Deepin Technology, featured with searching, copying, trash, compression/decompression, file property and other file management functions";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
