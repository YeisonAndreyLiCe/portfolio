{ inputs, makeScript, ... }:
makeScript {
  name = "markdownlint";
  entrypoint = ./entrypoint.sh;
  searchPaths = { bin = [ inputs.nixpkgs.markdownlint-cli ]; };
}
