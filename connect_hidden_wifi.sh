#!/bin/bash

# Script to connect to a hidden WiFi network on macOS
# Usage: ./connect_hidden_wifi.sh

SSID="*"
PASSWORD="@L01e1t1"

echo "Attempting to connect to hidden WiFi network with SSID: $SSID"

# Check if the network is already in the preferred networks list
networksetup -listpreferredwirelessnetworks en0 | grep -q "$SSID"
if [ $? -ne 0 ]; then
    echo "Adding hidden network to preferred networks list..."
    # Add the network as a hidden network
    networksetup -addpreferredwirelessnetworkatindex en0 "$SSID" 0 WPA2 "$PASSWORD" hidden
fi

# Connect to the network
echo "Connecting to the network..."
networksetup -setairportnetwork en0 "$SSID" "$PASSWORD"
