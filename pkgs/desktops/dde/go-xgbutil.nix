{ buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "go-xgbutil-${version}";
  version = "f7c97cef3b4e6c88280a5a7091c3314e815ca243";

  goPackagePath = "github.com/BurntSushi/xgbutil";

  src = fetchFromGitHub {
    owner = "BurntSushi";
    repo = "xgbutil";
    rev = "f7c97cef3b4e6c88280a5a7091c3314e815ca243";
    sha256 = "0kw0zmpbnymnalpj2wsvxbb7p5c297kv0qhyj20mcwg8dz64drnp";
  };

  goDeps = ./deps.go.nix;
}
