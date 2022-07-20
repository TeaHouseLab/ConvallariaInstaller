function stage4
    clear
    fmt_banner "ConvallariaLinux Installer"
    fmt_stage 0.7
    echo "Stage4: Set mirror"
    echo
    fmt_center "Use set <url> to set a debian mirror for debootstrap to grab from"
    fmt_center "Example: set https://mirrors.bfsu.edu.cn/debian/"
    fmt_bottom "$prefix console @ stage4 ~>"
    read -P "" input -a
    switch $input[1]
    case menu
        stage_menu
    case set
        set mirror $input[2] 
        if test -z $mirror
            error_input stage4 "Zero length is not allowed"
        else
            stage5
        end
    case '*'
        error_input 'stage4' "Unknown Input"
end
end