{ lib
, buildPythonPackage
, fetchPypi
, grpcio
, protobuf
, pythonOlder
, pythonRelaxDepsHook
}:

buildPythonPackage rec {
  pname = "grpcio-testing";
  version = "1.56.2";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Cg1dONvESb1ayz5ogv9AWHywqd0LdVsRDpIwtos+0SA=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace "'grpcio>={version}'.format(version=grpc_version.VERSION)" "'grpcio'"
  '';

  propagatedBuildInputs = [
    grpcio
    protobuf
  ];

  pythonImportsCheck = [
    "grpc_testing"
  ];

  # Module has no tests
  doCheck = false;

  meta = with lib; {
    description = "Testing utilities for gRPC Python";
    homepage = "https://grpc.io/";
    license = with licenses; [ asl20 ];
    maintainers = with maintainers; [ fab ];
  };
}
