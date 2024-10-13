{ inputs, makeScript, outputs, ... }:
makeScript {
  entrypoint = ./entrypoint.sh;
  name = "hooks-pre-push";
  searchPaths.bin = [ outputs."/spell-checker" outputs."/lintGitCommitMsg" ];
}
