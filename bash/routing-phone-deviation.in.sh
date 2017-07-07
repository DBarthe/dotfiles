# Sometimes I need bypass company's proxy
# So I add an extra NIC with my phone 4G connection
# But I want only a specific traffic to be routed to the phone

# usually that's my phone address
phone_gateway=192.168.1.1

# remove the default gateway associated to the phone
# and add destination ip according to memorized ones
phone_dev_setup() {
  sudo ip route del default via $phone_gateway
  if [ -f ~/.phone_deviation_memory ]; then
      for addr in $(cat ~/.phone_deviation_memory); do
        phone_dev_add "$addr"
      done
  fi
}

# add a destination ip I want to be routed to the phone
phone_dev_add() {
  sudo ip route add "$1" via "$phone_gateway"
  ensure_line_exists "$1" ~/.phone_deviation_memory
}
