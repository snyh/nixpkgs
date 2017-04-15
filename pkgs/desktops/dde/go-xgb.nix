{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "go-xgb-${version}";
  version = "27f122750802c950b2c869a5b63dafcf590ced95";

  goPackagePath = "github.com/BurntSushi/xgb";

  subPackages = [ ];
  src = fetchFromGitHub {
    owner = "BurntSushi";
    repo = "xgb";
    rev = "27f122750802c950b2c869a5b63dafcf590ced95";
    sha256 = "18lp2x8f5bljvlz0r7xn744f0c9rywjsb9ifiszqqdcpwhsa0kvj";
  };

}
