set fish_greeting

# FZF (fuzzy finder)
set -gx FZF_DEFAULT_OPTS "--extended \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
set -gx FZF_DEFAULT_COMMAND "ag --ignore .git -g ''"
set -gx FZF_CTRL_T_COMMAND "ag --hidden --ignore .git -g '' --ignore '.cache' --ignore '.dotfiles' --ignore '.local' --ignore '.mozilla'"

set -gx LANG en_US.UTF-8
set -gx MANPATH /usr/local/man:$MANPATH
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim
set -gx BROWSER firefox
set -gx ARCHFLAGS "-arch x86_64"
set -gx GCM_CREDENTIAL_STORE secretservice
set -gx GIT_PAGER delta
set -gx GOPATH $HOME/.local/share/go

fish_add_path $HOME/.config/scripts $HOME/.local/bin $HOME/bin /usr/local/bin $HOME/.cargo/bin $GOPATH/bin

abbr e $EDITOR
abbr dots "git --git-dir $HOME/.dotfiles --work-tree=$HOME"
abbr lazydots "lazygit -g $HOME/.dotfiles -w $HOME"

zoxide init fish | source
starship init fish | source

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/stephen/.miniconda3/bin/conda
    eval /home/stephen/.miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
