# shellcheck shell=bash

function main {
  local files=${1:-"src/**/*.{md,mdx}"}
  local config_file=${2:-".cspell.json"}

  : && cspell "${files}" -c "${config_file}" -u \
    || return 1
}

main "${@}"
