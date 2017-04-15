{ stdenv, unzip, pkgconfig, glib, gtk3, go-xgb, fetchFromGitHub, go,
dde-go-lib, go-gir-generator, go-fsnotify, go-x-image, go-xgbutil, go-kingpin }:

stdenv.mkDerivation rec {
  name = "dde-api-${version}";
  version = "3.1.7";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "dde-api";
    rev = version;
    sha256 = "1hv7z9xqp6r9l5vi3a5claig3vcb37c8338n0xp0z3nl47kmgsmn";
  };

  nativeBuildInputs = [ unzip go pkgconfig glib gtk3 ];

  buildPhase = ''
    export GOPATH=$GOPATH:${dde-go-lib}/share/go
    export GOPATH=$GOPATH:${go-gir-generator}/share/go
    export GOPATH=$GOPATH:${go-fsnotify.out}/share/go
    export GOPATH=$GOPATH:${go-xgb.out}/share/go
    export GOPATH=$GOPATH:${go-xgbutil.out}/share/go
    export GOPATH=$GOPATH:${go-x-image.out}/share/go
    export GOPATH=$GOPATH:${go-kingpin.out}/share/go
    make
  '';

  meta = {
    description = "Provides some dbus interfaces that is used for screen zone detecting, thumbnail generating, sound playing, etc";
    homepage = "https://github.com/linuxdeepin/dde-api";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
