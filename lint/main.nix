{ makeScript, inputs, outputs, ... }:
makeScript {
  entrypoint = ./entrypoint.sh;
  name = "code-style";
  searchPaths = {
    bin = [
      outputs."/lintNix"
      outputs."/lint/lint-code"
      outputs."/lint/spell-checker"
    ];
  };
}
