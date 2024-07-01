#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8

#INTERVAL="1"  # update interval in seconds
network_name=$(tmux show-option -gqv "@dracula-ip-network")

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

main() {
  while true
  do
#    initial_download=$(cat /sys/class/net/wlp2s0/statistics/rx_bytes)
#    initial_upload=$(cat /sys/class/net/wlp2s0/statistics/tx_bytes)
#    initial_ip=$(ip addr show dev wlp2s0 | grep "inet[^6]" | awk '{print $2}')
    initial_ip=$(ifconfig en0 | grep "inet " | awk '{print $2}')
    sleep $INTERVAL

    echo "$initial_ip"
#    echo " ⬇ $total_download_kbps kB/s • ⬆ $total_upload_kbps kB/s "
  done
}
main

