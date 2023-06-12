set fish_greeting

fish_add_path $HOME/.config/scripts $HOME/.local/bin $HOME/bin /usr/local/bin $HOME/.cargo/bin

# FZF (fuzzy finder)
set -gx FZF_DEFAULT_OPTS "--extended \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
set -gx FZF_DEFAULT_COMMAND "ag --ignore .git -g ''"
set -gx FZF_CTRL_T_COMMAND "ag --hidden --ignore .git -g '' --ignore '.cache' --ignore '.dotfiles' --ignore '.local' --ignore '.mozilla'"

set -gx LANG en_US.UTF-8
set -gx MANPATH /usr/local/man:$MANPATH
set -gx EDITOR nvim
set -gx BROWESER microsoft-edge-stable
set -gx ARCHFLAGS "-arch x86_64"
set -gx GCM_CREDENTIAL_STORE secretservice
set -gx GIT_PAGER delta

abbr e $EDITOR
abbr dots "git --git-dir $HOME/.dotfiles --work-tree=$HOME"
abbr lazydots "lazygit -g $HOME/.dotfiles -w $HOME"

zoxide init fish | source
starship init fish | source
