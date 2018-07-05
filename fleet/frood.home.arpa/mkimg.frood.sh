profile_frood() {
        profile_standard
        kernel_cmdline="console=tty0 console=ttyACM0,115200"
        kernel_flavors="vanilla"
        kernel_addons="zfs spl"
        apks="$apks zfs"
        apks="$apks linux-vanilla zfs-vanilla"
        apks="$apks linux-firmware"
}
