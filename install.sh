#!/usr/bin/env bash

set -e

ensure_line_exists() {
  grep -q -F "$1" "$2" \
    || echo "$1" >> "$2"
}

install_bash() {
  [ -L $HOME/.bashrc ] && { echo "There is already an symlink at .bashrc"; exit 0; }
  [ -f $HOME/.bashrc ] && mv $HOME/.bashrc $HOME/.bashrc.backup
  touch $(pwd)/bash/bashrc
  ensure_line_exists ". $(pwd)/bash/entry.in.sh" $(pwd)/bash/bashrc
  ln -s $(pwd)/bash/bashrc $HOME/.bashrc
}

main() {
  install_bash
}

main $@
