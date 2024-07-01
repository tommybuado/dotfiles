export BROWSER="/usr/bin/chromium-browser"
export EDITOR="/usr/bin/vim"
export PATH="$HOME/.local/bin:$PATH"

[ -f "$HOME/.ashrc" ] && export ENV="$HOME/.ashrc"

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec startx &> /dev/null
fi
