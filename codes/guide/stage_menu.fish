function stage_menu
    clear
    fmt_banner "ConvallariaLinux Installation"
    echo "Stage Menu"
    echo
    fmt_center "Choose a stage to enter"
    fmt_center "(1)Stage1: Set TimeZone"
    fmt_center "(2)Stage2: User Settings"
    fmt_center "(3)Stage3: Partition"
    fmt_center "(4)Stage4: Debootstrap set mirror"
    fmt_center "(5)Stage5: Final Confirm"
    fmt_center "(6)Abort installation"
    fmt_bottom "$prefix console @ menu ~>"
    read -n1 -P "" input
    switch $input
    case 1
        stage1
    case 2
        stage2
    case 3
        stage3
    case 4
        stage4
    case 5
        stage5
    case 6
        exit
    case '*'
        error_input 'stage_menu' 'Unknown Input'
    end
end