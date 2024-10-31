{
  lib,
  fetchFromGitLab,
  mkTclDerivation,
}:

mkTclDerivation rec {
  pname = "jimlib";
  version = "0.16.0";

  src = fetchFromGitLab {
    owner = "dbohdan";
    repo = "jimlib";
    rev = "v${version}";
    hash = "sha256-a7Su/JByGLgnYBCRbP9z9CunTIYTwAisWuQafZWYgYo=";
  };

  dontBuild = true;
  doCheck = true;

  checkPhase = ''
    runHook preCheck
    tclsh ./jimlib.tcl
    runHook postCheck
  '';

  installPhase = ''
    runHook preInstall
    install -Dm644 jimlib.tcl $out/lib/jimlib/jimlib.tcl
    install -Dm644 pkgIndex.tcl $out/lib/jimlib/pkgIndex.tcl
    runHook postInstall
  '';

  meta = {
    homepage = "https://gitlab.com/dbohdan/jimlib/";
    description = "Personal standard library for Jim Tcl";
    license = [
      lib.licenses.mit
      lib.licenses.tcltk
      lib.licenses.bsd3
    ];
    platforms = lib.platforms.all;
    maintainers = with lib.maintainers; [ neosloth ];
  };
}
