# shellcheck shell=bash

function check {
  local files=${1:-"all"}
  local config_file=${2:-".cspell.json"}

  case "${files}" in
    "all")
      cspell "**" "--config" "${config_file}"
      ;;
    "only-changed-files")
      git diff-tree --no-commit-id --name-only --diff-filter=d -r HEAD | cspell --file-list stdin -u --no-progress --no-must-find-files
      ;;
    *)
      cspell "${files}" "--config" "${config_file}"
      ;;
  esac
}

function main {
  local npm_path="lint/spell-checker"

  if running_in_ci_cd_provider; then
    npm_path=__argNPMPath__
  fi

  : && pushd "${npm_path}" \
    && npm ci \
    && export PATH="${PWD}/node_modules/.bin:${PATH}" \
    && popd \
    && info "Testing spelling" \
    && cspell-dict-fr-fr-link \
    && cspell-dict-es-es-link \
    && if check "${@}"; then
      info "Spelling test passed"
    else
      info "unknown works were detected" \
        && info "If you consider the word is not a typo, add it to the file project-words.txt" \
        && return 1
    fi
}

main "${@}"
