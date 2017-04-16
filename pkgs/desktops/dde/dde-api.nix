{
  buildGoPackage, stdenv, unzip, pkgconfig, fetchFromGitHub, go,
  glib, gtk3, go-xgb, libgudev, poppler, librsvg, libcanberra_gtk3,
  go-dde-dbus-factory, dde-go-lib, go-gir-generator, go-fsnotify, go-x-image, go-xgbutil, go-kingpin
 }:

stdenv.mkDerivation rec {
  name = "dde-api-${version}";
  version = "3.1.7";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "dde-api";
    rev = version;
    sha256 = "1hv7z9xqp6r9l5vi3a5claig3vcb37c8338n0xp0z3nl47kmgsmn";
  };

  patchPhase = ''
    patch thumbnails/pdf/thumbnail.c << EOF
    15,16c15,16
    < #include <glib/poppler-document.h>
    < #include <glib/poppler-page.h>
    ---
    > #include <poppler-document.h>
    > #include <poppler-page.h>
    EOF
  '';

  nativeBuildInputs = [ unzip go pkgconfig ];
  propagatedBuildInputs = [ poppler librsvg gtk3 glib libcanberra_gtk3 libgudev ];

  go-imaging = buildGoPackage rec {
    name = "go-imaging-${version}";
    version = "v1.1.0";

    goPackagePath = "github.com/disintegration/imaging";

    src = fetchFromGitHub {
      owner = "disintegration";
      repo = "imaging";
      rev = "ac27d1805a555e1754fa177216ee07f4e63c30b5";
      sha256 = "16w04adjm4h0ycidv64qcdafx05k36dj3b39l2pj7f12nvv9hyd7";
    };

    extraSrcPaths = [ "${go-x-image.out}/share/go" ];
  };

  buildPhase = ''
    export GOPATH=$GOPATH:${dde-go-lib}/share/go
    export GOPATH=$GOPATH:${go-gir-generator}/share/go
    export GOPATH=$GOPATH:${go-fsnotify.out}/share/go
    export GOPATH=$GOPATH:${go-xgb.out}/share/go
    export GOPATH=$GOPATH:${go-xgbutil.out}/share/go
    export GOPATH=$GOPATH:${go-x-image.out}/share/go
    export GOPATH=$GOPATH:${go-kingpin.out}/share/go
    export GOPATH=$GOPATH:${go-imaging.out}/share/go
    export GOPATH=$GOPATH:${go-dde-dbus-factory}/share/go
  '';

  installPhase = ''
    DESTDIR=$out make install
  '';

  meta = {
    description = "Provides some dbus interfaces that is used for screen zone detecting, thumbnail generating, sound playing, etc";
    homepage = "https://github.com/linuxdeepin/dde-api";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
