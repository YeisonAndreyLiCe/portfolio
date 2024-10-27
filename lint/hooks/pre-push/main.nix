{ inputs, makeScript, outputs, ... }:
makeScript {
  entrypoint = ./entrypoint.sh;
  name = "hooks-pre-push";
  searchPaths.bin = [
    outputs."/lint/spell-checker"
    outputs."/lintGitCommitMsg"
    outputs."/formatYaml"
    outputs."/formatBash"
    outputs."/lint/markdownlint"
  ];
}
