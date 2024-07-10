#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8

INTERVAL="3600"  # update interval in seconds
network_name=$(tmux show-option -gqv "@dracula-ip-network")

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

ip_function() {
  initial_ip=$(ifconfig en0 | grep "inet " | awk '{print $2}')
#  initial_ip=$(ip addr show dev wlp2s0 | grep "inet[^6]" | awk '{print $2}')
  echo "$initial_ip"
}

main() {

  echo $(ip_function)
  sleep $INTERVAL
}

#run main driver
main

