{ inputs, makeScript, ... }:
makeScript {
  entrypoint = ./entrypoint.sh;
  name = "spell-checker";
  searchPaths = { bin = [ inputs.nixpkgs.nodePackages.cspell ]; };
}
