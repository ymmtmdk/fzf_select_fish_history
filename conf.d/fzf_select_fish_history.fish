function fzf_select_fish_history
    if test (count $argv) -gt 0
        set qry -q "$argv"
    end

    # history save
    history merge
    history --show-time='%y-%m-%d %H:%M> ' | fzf $qry | sed -e "s/.\{16\}//" | read cmd

    if [ $cmd ]
        commandline $cmd
    end
end

bind ctrl-r fzf_select_fish_history (commandline)
