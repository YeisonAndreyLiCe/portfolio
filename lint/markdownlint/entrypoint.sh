# shellcheck shell=bash

function main {
  if running_in_ci_cd_provider; then
    markdownlint --config lint/markdownlint/.markdownlint.json 'src/blog'
  else
    markdownlint --fix --config lint/markdownlint/.markdownlint.json 'src/blog'
  fi
}

main "${@}"
