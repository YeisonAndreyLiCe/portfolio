# shellcheck shell=bash

function main {
  npm clean-install --ignore-scripts \
    && ./node_modules/.bin/eslint "$(pwd)" \
    || return 1
}

main "${@}"
