{ callPackage, pkgs }:

rec {
  #### the default terminal
  deepin-terminal = callPackage ./deepin-terminal.nix {
    vte = pkgs.gnome3.vte;
    wnck = pkgs.libwnck3;
    gee = pkgs.libgee_0_8;
  };

  dde-go-lib = callPackage ./go-lib.nix {
  };

  dde-dbus-generator = callPackage ./dbus-generator.nix {
  };

  dde-dbus-factory = callPackage ./dbus-factory.nix {
  };

  go-gir-generator = callPackage ./go-gir-generator.nix {
    libgudev = pkgs.libgudev.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs ++ [ pkgs.gobjectIntrospection ];
      configureFlags = oldAttrs.configureFlags ++ [ "--enable-introspection" ];
    });
  };

  ### the session manager
  startdde = callPackage ./startdde.nix {
  };


  # ### the application store client
  # deepin-appstore = callPackages ./deepin-appstore.nix {
  # }
  # ### the application store daemon
  # lastore-daemon = callPackages ./lastore-daemon.nix {
  # }
}
