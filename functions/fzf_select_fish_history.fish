function fzf_select_fish_history
    if test (count $argv) -gt 0
        set flags --query "$argv"
    end

    # history save
    #history --show-time="%y/%m/%d %H:%M │ "history | fzf | read cmd

    history merge
    history --show-time='%y-%m-%d %H:%M> ' | fzf | sed -e "s/.\{16\}//" | read cmd

    if [ $cmd ]
        commandline $cmd
    end
end

#
#        builtin history --null --show-time="$fzf_history_time_format │ " |
#        _fzf_wrapper --read0 \
#            --print0 \
#            --multi \
#            --scheme=history \ --prompt="History> " \
#            --query=(commandline) \
#            --preview="string replace --regex '$time_prefix_regex' '' -- {} | fish_indent --ansi" \
#            --preview-window="bottom:3:wrap" \
#            $fzf_history_opts |
#        string split0 |
#        # remove timestamps from commands selected
#        string replace --regex $time_prefix_regex ''
#
bind ctrl-r fzf_select_fish_history
