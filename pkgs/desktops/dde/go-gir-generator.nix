{ stdenv, unzip, fetchFromGitHub, pkgconfig, go, libgudev, gobjectIntrospection, dde-go-lib, dde-dbus-generator }:

stdenv.mkDerivation rec {
  name = "go-gir-generator-${version}";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "go-gir-generator";
    rev = version;
    sha256 = "126q99231vmwb76zqczqcls5p03z8n408vw6nf8g1yk7bjkbcjp7";
  };

  nativeBuildInputs = [ unzip pkgconfig dde-dbus-generator go dde-go-lib ];
  buildInputs = [ gobjectIntrospection libgudev ];

  buildPhase = ''
    export GOPATH=$GOPATH:${dde-go-lib.outPath}/share/gocode
    make
  '';

  installPhase = ''
     mkdir -p $out/share/gocode/src/
     cp -r out/src/gir $out/share/gocode/src
  '';

  meta = {
    description = "A static dbus binding tool imeplement static golang bindings for GObject";
    homepage = "https://github.com/linuxdeepin/go-gir-generator";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
