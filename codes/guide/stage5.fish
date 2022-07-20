function stage5
    clear
    fmt_banner "ConvallariaLinux Installer"
    fmt_stage 0.9
    echo "Stage5: Confirm action"
    echo
    fmt_center "Final confirm(type yes to continue)"
    fmt_center "Timezone: $tz"
    fmt_center "$install_root will be formated to ext4 and mount on /"
    fmt_center "Debootstrap will grab from $mirror"
    if test $efi = "on"
        fmt_center "$install_boot will be set as EFI partition"
    else
        fmt_center "Grub record will write to $install_boot"
    end
    fmt_bottom "$prefix console @ stage5 ~>"
    read -P "" input -a
    switch $input[1]
        case menu
            stage_menu
        case y Y
            installer
        case '*'
            error_input 'stage5' "Unknown Input"
    end
end