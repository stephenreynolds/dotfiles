if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end

alias vim="nvim"
alias dotfiles="git --git-dir $HOME/.dotfiles --work-tree=$HOME"

set -g theme_display_date no
