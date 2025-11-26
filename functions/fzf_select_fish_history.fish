function fzf_select_fish_history
    if test (count $argv) -gt 0
        set flags --query "$argv"
    end

    # history save
    history merge
    history | fzf | sed -e "s/.\{16\}//" | read cmd

    if [ $cmd ]
        commandline $cmd
    end
end
