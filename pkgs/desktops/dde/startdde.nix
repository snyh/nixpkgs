{ stdenv, unzip, fetchFromGitHub, pkgconfig, gtk3, cmake, gettext, go,
  dde-go-lib, dde-dbus-factory, go-gir-generator, go-xgb, go-xgbutil,
  go-fsnotify
}:

stdenv.mkDerivation rec {
  name = "startdde-${version}";
  version = "3.1.8";

  src = fetchFromGitHub {
    owner = "linuxdeepin";
    repo = "startdde";
    rev = version;
    sha256 = "1nnzxq3bkknn3z3m90ykzpw9kn742ghyimj4l5kj8cvqm7m34yr4";
  };

  buildPhase = ''
    export GOPATH=$GOPATH:${dde-go-lib.outPath}/share/go
    export GOPATH=$GOPATH:${dde-dbus-factory}/share/go
    export GOPATH=$GOPATH:${go-gir-generator}/share/go
    export GOPATH=$GOPATH:${go-xgb.out}/share/go
    export GOPATH=$GOPATH:${go-xgbutil.out}/share/go
    export GOPATH=$GOPATH:${go-fsnotify.out}/share/go
    make
  '';

  nativeBuildInputs = [ unzip gtk3 pkgconfig gettext go dde-go-lib go-gir-generator go-xgb];

  meta = {
    description = "The session manager of dde";
    longDescription = ''
        It's used for launching DDE components and invoking user's custom applications
        which compliant with xdg autostart specification.
     '';
    homepage = "https://github.com/linuxdeepin/startdde";
    license = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.linux;
  };
}
