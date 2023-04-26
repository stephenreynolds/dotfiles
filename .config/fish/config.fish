set fish_greeting

fish_add_path $HOME/.config/scripts $HOME/.local/bin $HOME/bin /usr/local/bin $HOME/.cargo/bin

# FZF (fuzzy finder)
set -gx FZF_DEFAULT_OPTS "--extended"
set -gx FZF_DEFAULT_COMMAND "ag --ignore .git -g ''"
set -gx FZF_CTRL_T_COMMAND "ag --hidden --ignore .git -g '' --ignore '.cache' --ignore '.dotfiles' --ignore '.local' --ignore '.mozilla'"

set -gx LANG en_US.UTF-8
set -gx MANPATH /usr/local/man:$MANPATH
set -gx EDITOR nvim
set -gx BROWESER microsoft-edge-stable
set -gx ARCHFLAGS "-arch x86_64"
set -gx GCM_CREDENTIALN_STORE secretservice

abbr e $EDITOR
abbr dots "git --git-dir $HOME/.dotfiles --work-tree=$HOME"
abbr lazydots "lazygit -g $HOME/.dotfiles -w $HOME"

zoxide init fish | source
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/stephen/.miniconda3/bin/conda
    eval /home/stephen/.miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
