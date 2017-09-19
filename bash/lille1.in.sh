# This module is specific to my university (Lille 1)

l1_proxy=https://proxy.univ-lille1.fr:3128

# automatically load lille1 proxy if connected to lille1 wifi
if command -v iwgetid >/dev/null 2>&1; then
  if [ "$(iwgetid -r)" = "LILLE1" ]; then
    proxy_on $l1_proxy
  fi
fi

# tsocks allows students to access external services, usually blocked by the firewall, such as ssh
if command -v tsocks >/dev/null 2>&1; then
  # install the user config file if necessary
  if [ ! -e ~/.tsocks.conf ]; then
    is_debug && echo "installing ~/.tsocks.conf"
    cp $ASSETS_DIR/tsocks.conf ~/.tsocks.conf
  fi

  # isntall the lsocks alias
  alias lsocks='bash $ASSETS_DIR/lsocks.sh'
fi
