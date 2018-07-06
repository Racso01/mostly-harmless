profile_frood() {
        profile_standard
        kernel_cmdline="console=tty0 console=ttyACM0,115200"
        kernel_flavors="vanilla"
        kernel_addons="zfs spl"
        apks="$apks joe strace tmux htop wget ca-certificates rsync tcpdump tree pv"
        apks="$apks zfs e2fsprogs gptfdisk ntfs-3g hdparm"
        apks="$apks linux-vanilla zfs-vanilla"
        apks="$apks linux-firmware"
}
