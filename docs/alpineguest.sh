#!/bin/sh

# Enable community repository (uncomment the row below if line 10 doesn't succeed
# echo "https://dl-cdn.alpinelinux.org/alpine/v3.19/community" >> /etc/apk/repositories

# Update package index
apk update

# Install VirtualBox Guest Additions and X11 support
apk add virtualbox-guest-additions virtualbox-guest-additions-x11

# Enable and start Guest Additions service
rc-update add virtualbox-guest-additions boot
rc-service virtualbox-guest-additions start

# Enable and start DRM client for graphical integration
rc-update add virtualbox-drm-client default
rc-service virtualbox-drm-client start

# Optional: Enable shared clipboard (run as user, not root)
# Uncomment the line below if needed
# VBoxClient --clipboard &

# Reboot to apply changes
# reboot
