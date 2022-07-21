function installer
    for var in tz pwd install_boot install_opt install_root mirror
        if test -z $$var
            logger 5 "Var $var is not configured, refuse to start"
            exit 128
        end
    end
    logger 4 "Start installing ConvallariaLinux to target machine"
    if curl -sL 'https://ruzhtw.top/' | grep -qs '<title>page</title>'
        logger 0 "Start formating root to ext4"
        if sudo mkfs -t ext4 $install_root
            logger 2 Formated
            logger 0 "Mounting to /mnt..."
            sudo mkdir -p /cva_install
            if sudo mount $install_root /cva_install
                logger 2 Mounted
            else
                logger 5 "Failed to mount $install_root to /cva_install, abort"
                exit 128
            end
        else
            logger 5 "Failed to format $install_root to ext4, abort"
            exit 128
        end
        set DEBIAN_FRONTEND noninteractive
        if sudo debootstrap \
                --components=main contrib non-free stable \
                --include=systemd-container,fish,curl,wget,file,jq,grub,sudo,gnupg,grub \
                /cva_install $mirror
            for chroot_mount_target in /dev /dev/pts /proc /sys
                sudo mount -o bind,rw $chroot_mount_target /cva_install/$chroot_mount_target
            end
            logger 0 "Configuring..."
            chroot /cva_install sh -c "echo root:$pwd | chpasswd"
            if test $efi = on
                sudo mount -t efivarfs none /sys/firmware/efi/efivars
                sudo mkdir -p /cva_install/boot/efi
                sudo mount -o bind,rw $install_boot /cva_install/boot/efi
                sudo mount -o bind,rw /sys/firmware/efi/efivars /cva_install/sys/firmware/efi/efivars
                sudo chroot /cva_install sh -c "sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Convallaria --recheck && sudo update-grub"
            else
                sudo mkdir -p /cva_install/boot/efi
                sudo chroot /cva_install sh -c "grub-install --force --target=i386-pc --recheck --boot-directory=/boot && sudo update-grub"
            end
            logger 2 "Bootstraped, start installing Convallaria Tools"
            sudo cp /usr/bin/ctpkg /cva_install/usr/bin/ctpkg
            sudo chmod +x /cva_install/usr/bin/ctpkg
            chroot /cva_install sh -c 'ctpkg grab upd -y && ctpkg grab ctpkg ctcontainer center-grub-theme -y'
            logger 2 "Installed, please reboot to Convallaria on disk"
        else
            logger 5 "Failed to bootstrap, abort"
            exit 128
        end
    else
        logger 5 "Network is not connected, abort"
        exit 128
    end
end
