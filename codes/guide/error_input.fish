function error_input
    clear
    fmt_banner "ConvallariaLinux Installation"
    echo
    fmt_center "$argv[2..-1]"
    fmt_bottom "[Press enter to re-enter this stage]"
    read -P "" pause
    $argv[1]
end
