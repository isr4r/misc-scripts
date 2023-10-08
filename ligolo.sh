#!/bin/bash
# usage : ligolo.sh -n 10.10.10.0/24 -p 8443

while getopts "n:p:" flag; do
    case "${flag}" in
        n) network="${OPTARG}" ;;
        p) port="${OPTARG}" ;;
        *) echo "Usage: $0 -n <network> -p <port>"
           exit 1 ;;
    esac
done

if [ -z "$network" ] || [ -z "$port" ]; then
    echo "[Example] ligolo -n 10.10.10./24 -p 443"
    echo "Both -n (network) and -p (port) options are required."
    exit 1
fi

sudo ip tuntap add user $USER mode tun ligolo
sudo ip link set ligolo up
sudo ip route add "$network" dev ligolo
echo "[Info] Please run 'agent.exe -connect <Kali IP>:$port -ignore-cert -retry' at the client side."
/path-to-proxy/proxy -selfcert -laddr "0.0.0.0:$port"
