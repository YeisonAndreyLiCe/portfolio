# shellcheck shell=bash

function main {
  if [ -n "${CI-}" ]; then
    npm clean-install --ignore-scripts
  fi

  : && ./node_modules/.bin/eslint || return 1
}

main "${@}"
