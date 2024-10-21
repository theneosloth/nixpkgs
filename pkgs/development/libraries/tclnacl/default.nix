{ lib, fetchfossil, tcl }:
tcl.mkTclDerivation rec {
  pname = "tclnacl";
  version = "1.1";
  src = fetchfossil {
    url = "https://fossil.sowaswie.de/nacl";
    rev = "6f9011f84cc6e7d7289e29741bc458a68eeb71060d36932af672bc10e0d712c9";
    sha256 = "sha256-zEWvhtIx9U0Q4bOmGSNBMoIEezloqWgLtdY87qjCPV0=";
  };

  meta = with lib; {
    homepage = "https://fossil.sowaswie.de/nacl/home";
    description = "NaCl (pronounced "salt") is a new easy-to-use high-speed software library for network communication, encryption, decryption, signatures, etc.";
    license = licenses.bsd3;
    maintainers = with maintainers; [ neosloth ];
  };
}
