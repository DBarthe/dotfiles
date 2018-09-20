
#
# Git stash aliases
#

# git stash list
slist() { git stash list; }
# git stash save <name>
ssave() { git stash save $*; }
# git stash show <name>
sshow() { git stash show stash^{/$*} -p; }
# git stash apply named stash
sapply() { git stash apply stash^{/$*}; }
