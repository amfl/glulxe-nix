let
    pkgs = import <nixpkgs> {};
    callPackage = pkgs.lib.callPackageWith (pkgs // self);
    self = {
        glkterm = callPackage ./glkterm.nix {};
        glulxe = callPackage ./glulxe.nix {};
    };
in
self
