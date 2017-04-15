{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "go-kingpin-${version}";
  version = "v2.2.4";

  goPackagePath = "gopkg.in/alecthomas/kingpin.v2";

  src = fetchFromGitHub {
    owner = "alecthomas";
    repo = "kingpin";
    rev = "7f0871f2e17818990e4eed73f9b5c2f429501228";
    sha256 = "1llh2m1awbp71n5fqxgkiwvw2q0wqnxrbzpkivybpmbsdvp0k4mn";
  };

  goDeps = ./go-kingpin.deps.nix;
}
