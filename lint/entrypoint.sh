# shellcheck shell=bash

function main {
  : && lint-nix-for-builtin \
    && spell-checker "only-changed-files" \
    && lint-code || return 1
}

main "${@}"
