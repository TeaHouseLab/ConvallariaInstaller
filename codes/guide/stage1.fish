function stage1
    clear
    fmt_banner "ConvallariaLinux Installer"
    fmt_stage 0.2
    echo "Stage1: Timezone settings"
    echo
    fmt_center "Type your timezone here"
    fmt_center "Use list to view all time zone"
    fmt_center "Use set <Your timezone> to confirm settings"
    fmt_bottom "$prefix console @ stage1 ~>"
    read -P "" input -a
    switch $input[1]
        case set
            if timedatectl list-timezones | grep -qs $input[2..-1]
            set tz $input[2..-1]
            stage2
            else
                error_input 'stage1' "The timezone you typed is not found on this system, please use list to see available timezones on this system"
            end
        case list
            timedatectl list-timezones
            stage1
        case menu
            stage_menu
        case '*'
            error_input 'stage1' "Unknown Input"
    end
end
