{
  description = "Glulxe interactive fiction client";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        callPackage = pkgs.lib.callPackageWith (pkgs // self);
      in rec {
        defaultPackage = packages.glulxe;

        packages = rec {
          fizmo = callPackage ./fizmo.nix {};
          glkterm = callPackage ./glkterm.nix {};
          glulxe = callPackage ./glulxe.nix { glkterm = glkterm; };
        };
      }
    );
}
