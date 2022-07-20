function stage2
    clear
    fmt_banner "ConvallariaLinux Installer"
    fmt_stage 0.3
    echo "Stage2: User settings"
    echo
    fmt_center "Set your root password here"
    fmt_center "Example: set password01"
    fmt_bottom "$prefix console @ stage2 ~>"
    read -P "" input -a
    switch $input[1]
        case menu
            stage_menu
        case set
            set pwd $input[2..-1]
            if test -z $pwd
                error_input stage2 "Password with zero length is not allowed"
            else
                stage3
            end
        case '*'
            error_input 'stage2' "Unknown Input"
    end
end
