{ stdenv, fetchFromGitHub,
  qt5, pkgconfig,
  deepin-tool-kit, freeimage, libexif, lcms2, libraw,
}:

stdenv.mkDerivation rec {
  name = "deepin-image-viewer-${version}";
  version = "1.2.13";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "deepin-image-viewer";
    rev = version;
    sha256 = "04x4fk9lmsflizrrknd0kjfnwmfxm91825yfxzrilykss0q2ry03";
  };

  nativeBuildInputs = [ pkgconfig qt5.qtbase qt5.qmakeHook ];
  buildInputs = [ qt5.qttools qt5.qtmultimedia qt5.qtx11extras deepin-tool-kit freeimage libexif lcms2 libraw ];

  enableParallelBuilding = true;

  meta = {
    homepage = "https://github.com/linuxdeepin/deepin-image-viewer";
    description = "The Deepin Desktop Environment Image Viewer";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
