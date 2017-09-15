l1_proxy=https://proxy.univ-lille1.fr:3128

if command -v iwgetid > /dev/null; then
  if [ $(iwgetid -r) = "LILLE1" ]; then
    proxy_on $l1_proxy
  fi
fi
