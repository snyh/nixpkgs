{ callPackage, pkgs }:

rec {
  buildGoPackage = callPackage ./go.nix {
     go = pkgs.go_1_8;
  };

  #### the default terminal
  deepin-terminal = callPackage ./deepin-terminal.nix {
    vte = pkgs.gnome3.vte;
    wnck = pkgs.libwnck3;
    gee = pkgs.libgee_0_8;
  };




  dde-api = callPackage ./dde-api.nix {
    gtk3 = pkgs.gnome3.gtk;
  };

  go-gir-generator = callPackage ./go-gir-generator.nix {
    libgudev = pkgs.libgudev.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs ++ [ pkgs.gobjectIntrospection ];
      configureFlags = oldAttrs.configureFlags ++ [ "--enable-introspection" ];
    });
  };

  dde-go-lib = callPackage ./go-lib.nix {};
  go-dde-dbus-factory = callPackage ./go-dde-dbus-factory.nix {};
  dde-qt-dbus-factory = callPackage ./dde-qt-dbus-factory.nix {};
  go-xgb = callPackage ./go-xgb.nix {};
  go-fsnotify = callPackage ./go-fsnotify.nix {};
  go-xgbutil = callPackage ./go-xgbutil.nix {};
  go-x-image = callPackage ./go-x-image.nix {};
  go-kingpin = callPackage ./go-kingpin.nix {};

  dde-dbus-generator = callPackage ./dbus-generator.nix {};

  ### the session manager
  startdde = callPackage ./startdde.nix {};

  gsettings-qt = callPackage ./gsettings-qt.nix {
  };

  deepin-tool-kit = callPackage ./deepin-tool-kit.nix {
    startup-notification = pkgs.gnome2.startup_notification;
  };
  dtksettings = callPackage ./dtksettings.nix {};

  libdui = callPackage ./libdui.nix {};

  deepin-image-viewer = callPackage ./deepin-image-viewer.nix {};

  dde-session-ui = callPackage ./dde-session-ui.nix {
    gtk2 = pkgs.gtk2-x11;
  };

  dde-dock = callPackage ./dde-dock.nix {
    libXtst = pkgs.xorg.libXtst;
  };


  # ### the application store client
  # deepin-appstore = callPackages ./deepin-appstore.nix {
  # }
  # ### the application store daemon
  # lastore-daemon = callPackages ./lastore-daemon.nix {
  # }
}
