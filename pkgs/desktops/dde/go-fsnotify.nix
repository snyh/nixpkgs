{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "go-xgb-${version}";
  version = "v0.9.0";

  goPackagePath = "github.com/howeyc/fsnotify";

  src = fetchFromGitHub {
    owner = "howeyc";
    repo = "fsnotify";
    rev = "441bbc86b167f3c1f4786afae9931403b99fdacf";
    sha256 = "1v5vrwhmidxjj6sppinyizf85v60zrmn7i6c9xk0pvx6k0kw2mr2";
  };
}
