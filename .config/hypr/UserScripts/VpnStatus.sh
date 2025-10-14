#!/bin/bash
# vpn_status_json.sh

out="$(openvpn3 sessions-list 2>/dev/null)"

# grab the first session's Config name and Status
name="$(awk -F': ' '/^ Config name:/{print $2; exit}' <<<"$out")"
status="$(awk -F': ' '/^      Status:/{print $2; exit}' <<<"$out")"

if [[ -n "$name" && "$status" == "Connection, Client connected" ]]; then
  alt="connected"
  tooltip="Connected to $name"
else
  # if no session or not connected, still emit something sensible
  name="${name:-Global}"
  alt="disconnected"
  tooltip="Not connected"
fi

# emit JSON (quotes properly escaped)
echo -e "{\"text\":\""$name"\", \"alt\":\""$alt"\",\"tooltip\":\""$tooltip"\"}"

