DOTFILES_DIR=$HOME/dotfiles

DEBUG=false
is_debug() {
  if [ "x$DEBUG" = "xtrue" ]; then
    return 0
  else
    return 1
  fi
}

include_order=$(cat <<EOF
  base.in.sh
  common.in.sh
  prompt.in.sh
  ssh-agent.in.sh
  emacs-cleaner.in.sh
EOF
)

for include in $include_order; do
  fullpath=$DOTFILES_DIR/bash/$include
  if [ -f "$fullpath" ]; then
    is_debug && echo_color $CYAN [DEBUG] sourcing $fullpath
    . $fullpath
  else
    is_debug && echo_color $RED [DEBUG] "can't source $fullpath"
  fi
done