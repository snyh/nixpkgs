{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "go-x-image-${version}";
  version = "7c3fafc74fb3a4a5e096c9557559d927f5098947";

  goPackagePath = "golang.org/x/image";

  src = fetchFromGitHub {
    owner = "golang";
    repo = "image";
    rev = "7c3fafc74fb3a4a5e096c9557559d927f5098947";
    sha256 = "0pgb6dbj5yzg6kz1ch0mqbvfkr87pjgw1x0ghjw8zjvkzm5in9v9";
  };

  goDeps = ./go-x-image.deps.nix;
}
