# Disable gretting
function fish_greeting 
end

# mkdir and cd in one command
function mkcd
    mkdir -p $argv && cd $argv
end

if status is-interactive
    # Add a new abbreviation where L will be replaced with | less, placing the cursor before the pipe.
    abbr -a L --position anywhere --set-cursor "% | less"

    # Add a replacement for the !! history expansion feature of bash.
    function last_history_item
	echo $history[1]
    end
    abbr -a !! --position anywhere --function last_history_item

    abbr -a e nvim
    abbr -a g lazygit

    # Use vim bindings and cursors
    fish_vi_key_bindings
    set fish_cursor_default     block      blink
    set fish_cursor_insert      line       blink
    set fish_cursor_replace_one underscore blink
    set fish_cursor_visual      block

    set -U fish_color_autosuggestion      brblack
    set -U fish_color_cancel              -r
    set -U fish_color_command             brgreen
    set -U fish_color_comment             brmagenta
    set -U fish_color_cwd                 green
    set -U fish_color_cwd_root            red
    set -U fish_color_end                 brmagenta
    set -U fish_color_error               brred
    set -U fish_color_escape              brcyan
    set -U fish_color_history_current     --bold
    set -U fish_color_host                normal
    set -U fish_color_match               --background=brblue
    set -U fish_color_normal              normal
    set -U fish_color_operator            cyan
    set -U fish_color_param               brblue
    set -U fish_color_quote               yellow
    set -U fish_color_redirection         bryellow
    set -U fish_color_search_match        'bryellow' '--background=brblack'
    set -U fish_color_selection           'white' '--bold' '--background=brblack'
    set -U fish_color_status              red
    set -U fish_color_user                brgreen
    set -U fish_color_valid_path          --underline
    set -U fish_pager_color_completion    normal
    set -U fish_pager_color_description   yellow
    set -U fish_pager_color_prefix        'white' '--bold' '--underline'
    set -U fish_pager_color_progress      'brwhite' '--background=cyan'

    # Enable starship
    starship init fish | source
end
