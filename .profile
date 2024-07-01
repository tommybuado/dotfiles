export BROWSER="/usr/bin/chromium-browser"
export EDITOR="/usr/bin/vim"

export GOPATH="$HOME/.local/lib/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

[ -f "$HOME/.ashrc" ] && export ENV="$HOME/.ashrc"

if [ -z "$XDG_RUNTIME_DIR" ]; then
	export XDG_RUNTIME_DIR="/tmp/runtime-$(id -u)"
	if [ ! -d "$XDG_RUNTIME_DIR" ]; then
		mkdir -pm 0700 $XDG_RUNTIME_DIR
	fi
fi

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec startx &> /dev/null
fi
