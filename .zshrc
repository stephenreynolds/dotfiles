# Path
export PATH=$HOME/.config/scripts:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
#ZSH_THEME="cdimascio-lambda"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Completion dots
COMPLETION_WAITING_DOTS="%F{yellow}...%f"

# History timestamp format
HIST_STAMPS="yyyy-mm-dd"

# FZF (fuzzy finder)
export FZF_DEFAULT_OPTS="--extended"
export FZF_DEFAULT_COMMAND="ag --ignore .git -g ''"
export FZF_CTRL_T_COMMAND="ag --hidden --ignore .git -g '' --ignore '.cache' --ignore '.dotfiles' --ignore '.local' --ignore '.mozilla'"

# Plugin
plugins=(git sudo colored-man-pages fzf zsh-syntax-highlighting nvm npm node)

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Manpages path
export MANPATH="/usr/local/man:$MANPATH"

# Locale
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export GCM_CREDENTIAL_STORE=cache

# Aliases
alias dots="git --git-dir $HOME/.dotfiles --work-tree=$HOME"
alias lazydots="lazygit -g $HOME/.dotfiles -w $HOME"
alias e="$EDITOR"

# zoxide
eval "$(zoxide init zsh)"

# nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
starship_precmd_user_func="set_win_title"

eval "$(starship init zsh)"
