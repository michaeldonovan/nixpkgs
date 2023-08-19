{ stdenv, lib, fetchFromGitHub, cmake, pkg-config }:

stdenv.mkDerivation {
  pname = "libDaisy";

  version = "5.4.0";
  src = fetchFromGitHub {
    owner = "electro-smith";
    repo = "libDaisy";
    rev = "v5.4.0"
    hash = "sha256-ivgpay41x3RUu4U5nf0VVhJA2bYJaw+wRWBf6bkoOqk=";
  };

  propagatedBuildInputs = [ cmake pkg-config ];

  # passthru = {
  #   hook = ./setup-hook.sh;
  # };

  meta = with lib; {
    description = "Hardware abstraction library for the Daisy audio platform"
    platforms = platforms.all;
    homepage = "https://github.com/electro-smith/libDaisy"
    license = licenses.mit;
    maintainers = [ maintainers.michaeldonovan ];
  };
}
