{ lib, fetchFromGitHub, stdenv,
  autoconf-archive, autoconf, automake, pkg-config,
  libxml2, ncurses
} :

stdenv.mkDerivation rec {
  name = "fizmo";
  version = "0.8.6-prerelease";

  src = fetchFromGitHub {
    owner = "chrender";
    repo = "fizmo";
    rev = "c13c64d54aa38f129640eabc2f7b59e09e5c039d";
    sha256 = "sha256-H3muzEIhB0d9/5ocgsyUjByPgcR7kXn0H71Nqc3lVok=";
    fetchSubmodules = true;
  };

  buildInputs = [
    autoconf
    autoconf-archive
    automake
    libxml2
    ncurses
    pkg-config
  ];

  preConfigure = "autoreconf -fi";

  configureFlags = [
    "--disable-x11"
    "--disable-jpeg"
    "--disable-png"
    "--disable-sdl"
    "--disable-aiff"
  ];

  meta = {
    homepage = "https://fizmo.spellbreaker.org/";
    description = "Z-machine interpreter";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ amfl ];
    platforms = with lib.platforms; all;
  };
}
