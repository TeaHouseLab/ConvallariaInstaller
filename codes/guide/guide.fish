function guide
    clear
    fmt_banner "ConvallariaLinux Installation"
    fmt_stage 0.1
    echo "Stage1: Intro"
    echo
    fmt_center "This is ConvallariaLinux Installer"
    fmt_center "This Program is released under GPLv3, you're free to copy, modify this program"
    fmt_center "This guide will help you install ConvallarLinux on your server"
    fmt_center "Be sure you've already got a backup"
    fmt_center "If you want to abort, please type menu at any point when installer ask you to input, then choose the exit stage"
    fmt_bottom "[Press enter to continue]"
    read -P "" pause
    stage1
end