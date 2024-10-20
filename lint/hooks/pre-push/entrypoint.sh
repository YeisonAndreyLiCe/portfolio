# shellcheck shell=bash

function main {
  : && lint-git-commit-msg-for-lint-git-commit-msg \
    && format-yaml-for-builtin \
    && format-bash-for-builtin \
    && info "Testing spelling" \
    && spell-checker "only-changed-files" || return 1
}

main "${@}"
