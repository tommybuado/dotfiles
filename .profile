# user-defined environments and start programs
export BROWSER="/usr/bin/chromium-browser"
export EDITOR="/usr/bin/vim"

export GOPATH="$HOME/.local/lib/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# graphics
export MESA_LOADER_DRIVER_OVERRIDE=iris

# enable built-in vi command line editor
set -o vi

# configure XDG_RUNTIME_DIR manually
if [ -z "$XDG_RUNTIME_DIR" ]; then
	export XDG_RUNTIME_DIR="/tmp/runtime-$(id -u)"
	if [ ! -d "$XDG_RUNTIME_DIR" ]; then
		mkdir -p $XDG_RUNTIME_DIR
		chmod 0700 $XDG_RUNTIME_DIR
	fi
fi

# shell prompt and aliases
[ -f "$HOME/.ashrc" ] && export ENV="$HOME/.ashrc"

# run X11 after login automatically
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	exec startx -- vt1 &> /dev/null
fi
