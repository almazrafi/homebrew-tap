#!/bin/sh

readonly default_style='\033[0m'
readonly error_style='\033[31m'

formula_latest_version() {
  curl -s "https://api.github.com/repos/almazrafi/$1/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/'
}

update_formula_specification() {
  path=$1
  name="${path%.*}"
  echo "Updating ${name} specification at '${path}'..."

  version=$(formula_latest_version $name 2>&1)

  if [ ! $version ];then
    echo "${error_style}Fatal error:${default_style} failed to get formula version"
    exit 1
  else
    echo "  Latest version: ${version}"
  fi

  repository="https://github.com/almazrafi/${name}"
  archive_tar="${repository}/archive/${version}.tar.gz"
  archive_sha=$(curl -L -s $archive_tar | shasum -a 256 | sed 's/ .*//')

  sed -i '' "s/\(version '\)\(.*\)\('\)/\1$version\3/" $path
  sed -i '' "s/\(sha256 '\)\(.*\)\('\)/\1$archive_sha\3/" $path

  echo "  ${name} specification successfully updated!"
}

readonly formula_name=$1

if [[ ! $formula_name ]]; then
  for file in *; do
    if [[ -f $file ]] && [[ $file = *.rb ]]; then
      update_formula_specification $file
    fi
  done
else
  update_formula_specification "${formula_name}.rb"
fi
