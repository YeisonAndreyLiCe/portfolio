# shellcheck shell=bash

function check {
  local files=${1:-"all"}
  local config_file=${2:-".cspell.json"}

  case "${files}" in
    "all")
      cspell "**" "--config" "${config_file}"
      ;;
    "only-changed-files")
      git diff-tree --no-commit-id --name-only --diff-filter=d -r HEAD | cspell --file-list stdin
      ;;
    *)
      cspell "${files}" "--config" "${config_file}"
      ;;
  esac
}

function main {
  : && if check "${@}"; then
    info "Spelling test passed"
  else
    info "unknown works were detected" \
      && info "If you consider the word is not a typo, add it to the file project-words.txt" \
      && return 1
  fi
}

main "${@}"
