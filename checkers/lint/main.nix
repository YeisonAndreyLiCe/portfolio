{ makeScript, inputs, ... }:
makeScript {
  entrypoint = ./entrypoint.sh;
  name = "lint-code";
  searchPaths = { bin = [ inputs.nixpkgs.nodejs_22 ]; };
}

