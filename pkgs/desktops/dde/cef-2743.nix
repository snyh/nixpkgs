{ stdenv, fetchurl,
  qt5, pkgconfig, cmake, libpthreadstubs, gtk2, proxychains,
}:

stdenv.mkDerivation rec {
  name = "cef-2743";
  version = "2743";

  src = (fetchurl {
    url = "http://opensource.spotify.com/cefbuilds/cef_binary_3.2743.1449.g90ba67d_linux64_minimal.tar.bz2";
    sha256 = "1vbji5lm4h9wica5g298j2ck9qigddzps304ny8dlm547ws48y1l";
  }).overrideAttrs (oldAttrs: {
      buildInputs = (oldAttrs.buildInputs or []) ++ [ proxychains ];
  });


  buildInputs = [
  ];

  enableParallelBuilding = true;

  meta = {
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
