function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # fastfetch

    alias q='exit'
    alias c='clear'

    alias lf='yazi'

    alias nv='nvim'
    alias nv.='nvim .'

    alias cmat='cmatrix -abs'
    # alias boiler='mpv --loop ~/music/Zenker\ Brothers/boiler_room_munich.opus'
    alias wttr='curl wttr.in/kiel'
    alias wttr2='curl v2d.wttr.in/kiel'

    alias g='git'
    alias gc='git commit'
    alias gd='git diff'
    alias gst='git status'
    alias gg='git log --graph --decorate'
    alias glo='git log --oneline'
    alias gca='git commit -a'
    alias gcm='git commit -m'
    alias gcam='git commit -am'
    alias lg='lazygit'

    zoxide init fish | source
    alias cd='z'
    starship init fish | source
end

export EDITOR='nvim'

# fish_add_path ~/.local/share/nvim/mason/bin/
thefuck --alias | source
