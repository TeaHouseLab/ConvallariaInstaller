function stage3
    clear
    fmt_banner "ConvallariaLinux Installation"
    fmt_stage 0.5
    echo "Stage3: Partition"
    echo
    fmt_center "Pick up two partition for installing the system"
    fmt_center "Use modify to modify your disk"
    echo
    fmt_center "Set example for MBR user: set mbr /dev/sda1 /dev/sda2 /dev/sda"
    fmt_center "Sda1 will be mounted to /, sda2 will be mount to /opt, MBR record will be write on /dev/sda"
    fmt_center "Set example for UEFI user: set efi /dev/sda1 /dev/sda2 /dev/sda3"
    fmt_center "Sda1 will be mounted to /, sda2 will be mount to /opt, sda3 will be your esp partition"
    fmt_center "/opt will be configured to store data"
    fmt_bottom "$prefix console @ stage3 ~>"
    read -P "" input -a
    switch $input[1]
        case menu
            stage_menu
        case modify
            sudo cfdisk
            stage3
        case set
            switch $input[2]
                case efi
                    if test -e $input[3]; and test -e $input[4]; and test -e $input[5]
                        set install_root $input[3]
                        set install_opt $input[4]
                        set install_boot $input[5]
                        set efi on
                        stage4
                    else
                        error_input stage3 "At least one disk is not available, please check again"
                    end
                case mbr
                    if test -e $input[3]; and test -e $input[4]; and test -e $input[5]
                        set install_root $input[3]
                        set install_opt $input[4]
                        set install_boot $input[5]
                        stage4
                    else
                        error_input stage3 "At least one disk is not available, please check again"
                    end
                case '*'
                    error_input stage3 "Unknown Input $input[2], only efi and mbr are accepted"
            end
        case '*'
            error_input stage3 "Unknown Input"
    end
end
