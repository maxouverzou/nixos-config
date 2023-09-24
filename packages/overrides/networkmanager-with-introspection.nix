{ networkmanager, gobject-introspection, ... }:
# to be able to use nm w/ pygobject; requires compilation of webkitgtk!
networkmanager.overrideAttrs (oldAttrs: {
  buildInputs = (oldAttrs.buildInputs or [ ]) ++ [ gobject-introspection ];
  configureFlags = (oldAttrs.configureFlags or [ ]) ++ [ "--enable-introspection" ];

  passthru = {
    gir_path = "/share/gir-1.0";
    gi_typelib_path = "/lib/girepository-1.0";
  };
})
