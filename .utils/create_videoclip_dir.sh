#!/usr/bin/env sh

# Create directory for mpv video clips
mkdir -p ~/Videos/mpv_videoclips

# Replace placeholders in mpv configuration files
sed -i "s/\<user\>/$(whoami)/g" "$HOME/.config/mpv/script-opts/videoclip.conf"
sed -i "s/\<user\>/$(whoami)/g" "$HOME/.config/mpv/mpv.conf"
sed -i "s/\<uname\>/$(whoami)/g" "$HOME/.config/mpv/script-opts/youtube-download.conf"
