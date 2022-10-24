if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end

alias dotfiles="git --git-dir $HOME/.dotfiles --work-tree=$HOME"

set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_master_branch yes
set -g theme_display_git_untracked yes
set -g theme_display_git_dirty yes
set -g theme_display_nvm yes
set -g theme_display_virtualenv yes
set -g theme_color_scheme zenburn
