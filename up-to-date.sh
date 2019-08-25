#!/bin/zsh

check_ports() {
    sudo /opt/local/bin/port selfupdate
    outdated_ports="$(/opt/local/bin/port outdated)"
    if [[ "$outdated_ports" != "No installed ports are outdated." ]]; then
        osascript -e "display notification \"MacPorts: $outdated_ports\" with title \"Up to date\""
    fi
}

check_npm() {
    outdated_packages="$(sudo /opt/local/bin/npm -g outdated)"
    if [ -n "$outdated_packages" ]; then
        osascript -e "display notification \"npm: $outdated_packages\" with title \"Up to date\""
    fi
}

check_ports &
check_npm &

wait $(jobs -p)
