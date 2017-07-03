{ stdenv, fetchFromGitHub, qt5, pkgconfig, gtk2, git, cacert, libSM, mtdev, libqtxdg,
  deepin-tool-kit,
 }:

stdenv.mkDerivation rec {
  name = "qt5-integration-${version}";
  version = "0.2.0";
  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "qt5integration";
    rev = version;
    sha256 = "0ijanknpsggc4czffbhwq5gxrd4iw3lmjjln98xiayw272aji5yn";
  };

  NIX_SSL_CERT_FILE = "${cacert}/etc/ssl/certs/ca-bundle.crt";

  buildInputs = [ qt5.qmakeHook libqtxdg pkgconfig gtk2 deepin-tool-kit libSM mtdev git ];
  nativeBuildInputs = [ qt5.qtbase qt5.qtx11extras qt5.qtsvg ];

  postPatch = ''
    sed -e "s@\$\$\[QT_INSTALL_PLUGINS\]@$out/lib/qt5/plugins@" -i */*.pro
  '';

  meta = with stdenv.lib; {
    homepage = "https://github.com/linuxdeepin/qt5integration";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
