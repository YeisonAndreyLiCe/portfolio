let
  commit = "9cfda448e22d4c995392a031a7b0ef50f29da0d5";
  sha256 = "sha256:00ds34n2jws9r32bp3kr6zmblkfvnkfakq8lx0k0ihp85783qmfs";
in {
  makesSrc = builtins.fetchTarball {
    inherit sha256;
    url = "https://api.github.com/repos/fluidattacks/makes/tarball/${commit}";
  };
}
