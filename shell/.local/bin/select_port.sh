#!/usr/bin/env bash
# Show a list of listening tcp ports (like http servers)
# Select 1 with fzf and open in a specific chrome-dev profile
set -euo pipefail

get_tcp_listening_ports() {
    ss --numeric --no-header --processes --tcp --listening \
        sport != :53 # don't care about port 53 (DNS)
}

remove_leading_and_trailing_whitespace() {
    awk '{$1=$1;print}'
}

get_cmdline() {
    local pid="$1"
    ps -p $pid -o cmd="" | remove_leading_and_trailing_whitespace
}

get_parent_cmdline() {
    local pid="$1"
    local ppid=$(ps -p $pid -o ppid="" | remove_leading_and_trailing_whitespace)
    get_cmdline $ppid
}

format_results() {
    local ss_results="$1"
    while IFS= read -r line; do
        port=$(echo $line | awk '{print $4}' | cut -d ':' -f2)
        pid=$(echo $line | grep -oP 'pid=\K\d+')
        cmdline=$(get_cmdline $pid)
        parent_cmdline=$(get_parent_cmdline $pid)
        cwd=$(readlink --canonicalize /proc/$pid/cwd)
        cwd="${cwd/#$HOME/\~}"
        echo -e -n "${port}\n    ${cwd}\n    ${parent_cmdline}\n        ${cmdline}\0"
    done <<< "$ss_results"
}

ss_results=$(get_tcp_listening_ports)

if [ -z "$ss_results" ]; then
    echo "No results"
    exit 1
fi

selected_port=$(
    format_results "$ss_results" \
        | fzf --select-1 --exit-0 --read0 --height 70% --layout reverse
)

if [ -z "$selected_port" ]; then
    echo "Cancelled"
    exit 1
fi

echo "$selected_port" \
    | head -1 \
    | awk '{print "http://127.0.0.1:" $1}'
