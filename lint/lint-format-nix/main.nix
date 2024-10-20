{ makeScript, inputs, outputs, ... }:
makeScript {
  entrypoint = ./entrypoint.sh;
  name = "check-nix";
  searchPaths = { bin = [ outputs."/lintNix" outputs."/formatNix" ]; };
}
