# shellcheck shell=bash

function main {
  if running_in_ci_cd_provider; then
    markdownlint --config lint/markdownlint/.markdownlint.jsonc 'src/content'
  else
    markdownlint --fix --config lint/markdownlint/.markdownlint.jsonc 'src/content'
  fi
}

main "${@}"
