
#!/usr/bin/env sh

replace_placeholder(){
	if [ -d "$HOME/.config/mpv" ]; then
		# replace user with username
    	sed -i "s/\<user\>/$(whoami)/" "$HOME/.config/mpv/mpv.conf"

		# replace uname with username
		sed -i "s/\<uname\>/$(whoami)/" "$HOME/.config/mpv/script-opts/youtube-download.conf"
	fi
}


replace_placeholder