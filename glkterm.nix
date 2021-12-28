{ lib, fetchFromGitHub, stdenv, ncurses } :

stdenv.mkDerivation rec {
  name = "glkterm";
  version = "1.0.4";

  src = fetchFromGitHub {
    owner = "erkyrath";
    repo = name;
    rev = "${name}-${version}";
    sha256 = "sha256-EL7jzqlBa1pRNspyxaIMGLfwf5+/nq8Wyi0UCM7pPCw=";
  };

  buildInputs = [ ncurses ];

  installPhase = ''
    mkdir -p $out/lib
    mkdir -p $out/include
    cp Make.glkterm *.h $out/include/
    cp libglkterm.a $out/lib/
  '';

  meta = {
    homepage = "https://github.com/erkyrath/glkterm";
    description = "curses.h implementation of the Glk API";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ amfl ];
    platforms = with lib.platforms; all;
  };
}
