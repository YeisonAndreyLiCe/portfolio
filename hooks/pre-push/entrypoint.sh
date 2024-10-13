# shellcheck shell=bash

function main {
  : && lint-git-commit-msg-for-lint-git-commit-msg \
    && spell-checker
}

main "${@}"
