{
  buildPythonPackage,
  fetchPypi,
  lib,
  edalize,
  fastjsonschema,
  pyparsing,
  pyyaml,
  simplesat,
  ipyxact,
  argcomplete,
  setuptools-scm,
}:
buildPythonPackage rec {
  pname = "fusesoc";
  version = "2.4.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/CWwbLUvUWzQDG0EyfY4IF5G8+NehA/D+OwAuzpkBdU=";
  };

  pythonRemoveDeps = [
    "jsonschema2md"
  ];

  build-system = [ setuptools-scm ];

  dependencies = [
    edalize
    fastjsonschema
    pyparsing
    pyyaml
    simplesat
    ipyxact
    argcomplete
  ];

  pythonImportsCheck = [ "fusesoc" ];

  meta = with lib; {
    homepage = "https://github.com/olofk/fusesoc";
    description = "Package manager and build tools for HDL code";
    maintainers = with maintainers; [ genericnerdyusername ];
    license = licenses.bsd3;
    mainProgram = "fusesoc";
  };
}
