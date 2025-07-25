# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
#
# User specific environment and startup programs
. "$HOME/.cargo/env"

if uwsm check may-start && uwsm select; then
    # For GUI session choice:
	# exec uwsm start default
	exec uwsm start hyprland-uwsm.desktop
fi
