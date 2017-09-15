PROXY_ENV_FILE=/tmp/proxy_env
PROXY_VARS="http_proxy HTTP_PROXY https_proxy HTTPS_PROXY ftp_proxy FTP_PROXY"

lille1_proxy=https://proxy.univ-lille1.fr:3128

proxy_source() {
  if [ -f "$PROXY_ENV_FILE" ]; then
    is_debug && echo "[DEBUG] loading PROXY_ENV_FILE ($PROXY_ENV_FILE)"
    source "$PROXY_ENV_FILE"
  fi
}

proxy_on() {
  if [ $# -lt 1 ]; then
    echo 'usage: proxy_on <url>'
    return 1
  fi

  proxy_off
  for var in $PROXY_VARS; do
    echo "export $var=$1" >> "$PROXY_ENV_FILE"
  done
  proxy_source
}

proxy_off() {
  for var in $PROXY_VARS; do
    unset $var
  done
  rm -f "$PROXY_ENV_FILE"
}
