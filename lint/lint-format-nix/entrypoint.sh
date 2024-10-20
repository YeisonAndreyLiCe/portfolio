# shellcheck shell=bash

function main {
  : && lint-nix-for-builtin \
    && format-nix-for-builtin || return 1
}

main "${@}"
