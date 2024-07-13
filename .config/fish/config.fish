status is-login; and begin
    # Login shell initialisation
    gpgconf --launch gpg-agent
end

# Disable gretting
function fish_greeting
end

status is-interactive; and begin
    # Abbreviations
    abbr --add -- e nvim
    abbr --add -- g lazygit
    abbr --add -- jqless 'jq -C | less -r'
    abbr --add -- ls lsd
    abbr --add -- lsa 'lsd -A'
    abbr --add -- lsl 'lsd -l'
    abbr --add -- lsla 'lsd -lA'
    abbr --add -- lslt 'lsd -l --tree'
    abbr --add -- lst 'lsd --tree'
    abbr --add -- tree 'lsd --tree'
    abbr --add L --position anywhere --set-cursor "% | less"

    # Aliases
    alias clear 'printf '\''\033[2J\033[3J\033[1;1H'\'''
    alias vimdiff 'nvim -d'

    zoxide init fish | source

    # Starship
    if test "$TERM" != dumb
        eval (starship init fish)
        enable_transience
    end

    function __fish_command_not_found_handler --on-event fish_command_not_found
        command-not-found $argv
    end

    # direnv
    set -x DIRENV_LOG_FORMAT = ''
    direnv hook fish | source

    # Add a replacement for the !! history expansion feature of bash.
    function last_history_item
        echo $history[1]
    end
    abbr -a !! --position anywhere --function last_history_item

    # Use vim bindings and cursors
    fish_vi_key_bindings
    set fish_cursor_default block blink
    set fish_cursor_insert line blink
    set fish_cursor_replace_one underscore blink
    set fish_cursor_visual block

    set -U fish_color_autosuggestion brblack
    set -U fish_color_cancel -r
    set -U fish_color_command brgreen
    set -U fish_color_comment brmagenta
    set -U fish_color_cwd green
    set -U fish_color_cwd_root red
    set -U fish_color_end brmagenta
    set -U fish_color_error brred
    set -U fish_color_escape brcyan
    set -U fish_color_history_current --bold
    set -U fish_color_host normal
    set -U fish_color_match --background=brblue
    set -U fish_color_normal normal
    set -U fish_color_operator cyan
    set -U fish_color_param brblue
    set -U fish_color_quote yellow
    set -U fish_color_redirection bryellow
    set -U fish_color_search_match bryellow '--background=brblack'
    set -U fish_color_selection white --bold '--background=brblack'
    set -U fish_color_status red
    set -U fish_color_user brgreen
    set -U fish_color_valid_path --underline
    set -U fish_pager_color_completion normal
    set -U fish_pager_color_description yellow
    set -U fish_pager_color_prefix white --bold --underline
    set -U fish_pager_color_progress brwhite '--background=cyan'
end
