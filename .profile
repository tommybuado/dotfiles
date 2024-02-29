# user-defined environments and start programs
export PATH="$HOME/.local/bin:$PATH"

# enable built-in vi command line editor
set -o vi

# shell prompt configuration and aliases
[ -f "$HOME/.ashrc" ] && export ENV="$HOME/.ashrc"

# configure XDG_RUNTIME_DIR manually
if [ -z "$XDG_RUNTIME_DIR" ]; then
	export XDG_RUNTIME_DIR="/tmp/runtime-$(id -u)"

	if [ ! -d "$XDG_RUNTIME_DIR" ]; then
		mkdir -pm 0700 "$XDG_RUNTIME_DIR"
	fi
fi
