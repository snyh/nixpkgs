{ stdenv, fetchFromGitHub,
  qt5, pkgconfig,
}:

stdenv.mkDerivation rec {
  name = "dtksettings-${version}";
  version = "0.1.5";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "dtksettings";
    rev = version;
    sha256 = "0mj1r5glj6ckp17q3l4b7cs03jczqxg0504qb8x0g8mpdsj7z1jf";
  };

  nativeBuildInputs = [ pkgconfig qt5.qtbase qt5.qmakeHook ];
  buildInputs = [ qt5.qttools ];

  enableParallelBuilding = true;

  meta = {
    homepage = "https://github.com/linuxdeepin/dtksettings";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
