# For more information visit:
# https://github.com/fluidattacks/makes
{ fetchNixpkgs, ... }:
let
  nixpkgs = fetchNixpkgs {
    rev = "4a92571f9207810b559c9eac203d1f4d79830073";
    sha256 = "sha256:0sp7qjbb7dvrh4zvd40i6y7jwsd1v1qj44f0c95q88g7fikda8gq";
  };
in {
  extendingMakesDirs = [ "/" ];
  formatBash = {
    enable = true;
    targets = [ "/" ];
  };
  formatNix = {
    enable = true;
    targets = [ "/" ];
  };
  formatYaml = {
    enable = true;
    targets = [ "/.github/workflows/" ];
  };
  lintBash = {
    enable = true;
    targets = [ "/" ];
  };
  lintGitCommitMsg = {
    branch = "main";
    enable = true;
    config = "/.lint-git-commit-msg/config.js";
    parser = "/.lint-git-commit-msg/parser.js";
  };
  lintNix = {
    enable = true;
    targets = [ "/" ];
  };
  inputs = { inherit nixpkgs; };
}
