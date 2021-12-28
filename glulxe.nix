{ lib, fetchFromGitHub, stdenv, glkterm, ncurses } :

stdenv.mkDerivation rec {
  name = "glulxe";
  version = "0.5.4";

  src = fetchFromGitHub {
    owner = "erkyrath";
    repo = name;
    rev = "${name}-${version}";
    sha256 = "sha256-KSkrC3Jjh/P/0KEmt+keGInar8Px+hiTxp4t0sujHT0=";
  };

  meta = {
    homepage = "https://eblong.com/zarf/glulx/";
    description = "A 32-Bit Virtual Machine for Interactive Fiction";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ amfl ];
    platforms = with lib.platforms; all;
  };

  buildInputs = [ glkterm ncurses ];

  buildFlags = [
    "GLKINCLUDEDIR=${glkterm}/include"
    "GLKLIBDIR=${glkterm}/lib"
    "GLKMAKEFILE=Make.glkterm"
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp glulxe $out/bin/
  '';
}
