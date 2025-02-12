{ lib
, stdenv
, fetchurl
, ncurses
, zig_0_11
, installShellFiles
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "ncdu";
  version = "2.3";

  src = fetchurl {
    url = "https://dev.yorhel.nl/download/ncdu-${finalAttrs.version}.tar.gz";
    hash = "sha256-u84dHHDxJHZxvk6iE12MUs0ppwivXtYs7Np9xqgACjw=";
  };

  nativeBuildInputs = [
    zig_0_11.hook
    installShellFiles
  ];

  buildInputs = [
    ncurses
  ];

  postInstall = ''
    installManPage ncdu.1
  '';

  meta = {
    homepage = "https://dev.yorhel.nl/ncdu";
    description = "Disk usage analyzer with an ncurses interface";
    changelog = "https://dev.yorhel.nl/ncdu/changes2";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ pSub rodrgz ];
    inherit (zig_0_11.meta) platforms;
    mainProgram = "ncdu";
  };
})
