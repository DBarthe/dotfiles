#!/usr/bin/env bash

set -e

install_bash() {
  [ -L $HOME/.bashrc ] && (echo "There is already an symlink at .bashrc"; return )
  [ -f $HOME/.bashrc ] && mv $HOME/.bashrc $HOME/.bashrc.backup
  ln -s $(pwd)/bash/entry.in.sh $HOME/.bashrc
}

main() {
  install_bash
}

main $@
