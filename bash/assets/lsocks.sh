# tsocks wrapper to read credentials secretly

set -e

if [ -z $TSOCKS_USERNAME ]; then
  read -p "fil username [$USER]: " TSOCKS_USERNAME
  TSOCKS_USERNAME=${TSOCKS_USERNAME:-$USER}
  export TSOCKS_USERNAME
fi

if [ -z $TSOCKS_PASSWORD ]; then
  read -s -p "fil password: " TSOCKS_PASSWORD
  echo
  export TSOCKS_PASSWORD
fi

tsocks $@
