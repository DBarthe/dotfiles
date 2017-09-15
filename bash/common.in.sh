GREEN='\033[1;32m'
RED='\033[1;31m'
MAGENTA='\033[1;35m'
NOCOLOR='\033[0m'
CYAN='\033[1;36m'
NOCOLOR='\033[0m'

echo_color() {
    color="$1"
    shift
    text="$@"
    echo -e "${color}$text${NOCOLOR}";
}

show_and_exec(){
  echo_color $CYAN "$@"
  eval "$@"
}

retry_command () {
  n=$1
  shift;
  for i in $(seq 1 $n); do
    show_and_exec sleep 5 "# try $i/$n"
    eval "$@" && break
  done
  return $?
}

ensure_line_exists() {
  grep -q -F "$1" "$2" \
    || echo "$1" >> "$2"
}
