function fzf_select_fish_history
    # history save
    history merge
    history --show-time='%y-%m-%d %H:%M> ' | fzf -q (commandline) | sed -e "s/.\{16\}//" | read cmd

    if [ $cmd ]
        commandline $cmd
    end
end

bind ctrl-r fzf_select_fish_history
