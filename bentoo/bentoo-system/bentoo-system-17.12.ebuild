# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

inherit mount-boot

DESCRIPTION="Bentoo system meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64 arm x86"

IUSE_VIDEO_CARDS="video_cards_nvidia video_cards_virtualbox video_cards_vmware"
IUSE="android bindist binwalk btrfs exfat fat iasl jfs livecd livecd-stage1 +luks\
 lvm nfs ntfs -pax_kernel reiser reiser4 +rxvt samba +squashfs thinkpad +udf qemu\
 zfs ${IUSE_VIDEO_CARDS}"

S="${WORKDIR}"

# Things needed for a running system and not for livecd
PDEPEND="livecd? ( bentoo/bentoo-livecd )
	!livecd? ( !bentoo/bentoo-livecd
	!app-misc/livecd-tools )"

# Basic systems
PDEPEND="${PDEPEND}
	qemu? ( app-emulation/virt-manager
		!livecd-stage1? ( sys-apps/usermode-utilities ) )
	video_cards_vmware? ( !livecd-stage1? ( app-emulation/open-vm-tools ) )
	"

#    bentoo/bentoo-mpv
PDEPEND="${PDEPEND}
	!arm? ( !livecd-stage1? (
		|| ( sys-boot/grub:0 sys-boot/grub-static sys-boot/grub:2 sys-boot/systemd-boot )
		)
		sys-boot/syslinux
		sys-boot/efibootmgr )
	!arm? ( app-portage/cpuid2cpuflags )
	!arm? ( sys-firmware/intel-microcode )

	!arm? ( sys-power/acpid )
	!arm? ( sys-power/thermald )
	!livecd-stage1? (
			video_cards_virtualbox? ( !pax_kernel? ( app-emulation/virtualbox-guest-additions ) )
			video_cards_nvidia? ( x11-misc/bumblebee ) )
	amd64? ( sys-apps/fwts )
	android? ( dev-util/android-tools )
	app-admin/checksec
	app-admin/localepurge
	app-admin/logrotate
	app-admin/sudo
	app-admin/sysstat
	app-arch/p7zip
	app-arch/rpm2targz
	app-arch/sharutils
	app-arch/unrar
	app-arch/unzip
	app-arch/xz-utils
	app-cdr/iat
	app-crypt/gnupg
	app-crypt/openvpn-blacklist
	app-misc/mc
	app-misc/tmux
	app-shells/bash-completion
	app-text/tree
	bentoo/bentoo-build
	bentoo/bentoo-devel
	bentoo/bentoo-version
	binwalk? ( app-misc/binwalk )
	btrfs? ( sys-fs/btrfs-progs )
	dev-libs/elfutils
	dev-python/ipython
	dev-util/dialog
	dev-util/vbindiff
	dev-vcs/git
	dev-vcs/git-flow
	exfat? ( sys-fs/exfat-utils )
	exfat? ( sys-fs/fuse-exfat )
	fat? ( sys-fs/dosfstools )
	iasl? ( sys-power/iasl )
	jfs? ( sys-fs/jfsutils )
	livecd? ( sys-kernel/linux-firmware )
	livecd? ( || ( sys-kernel/genkernel sys-kernel/genkernel-next ) )
	luks? ( sys-fs/cryptsetup )
	luks? ( sys-fs/multipath-tools )
	lvm? ( sys-fs/lvm2 )
	mail-client/mutt
	mail-filter/procmail
	media-fonts/iso_latin_1
	media-gfx/graphviz
	media-sound/alsa-utils
	net-dialup/ppp
	net-firewall/ipset
	net-firewall/iptables
	net-fs/curlftpfs
	net-fs/sshfs
	net-mail/getmail
	net-misc/dhcp
	net-misc/dhcpcd
	net-misc/mosh
	net-misc/ntp
	net-misc/vconfig
	net-vpn/openvpn
	net-wireless/bluez
	net-wireless/iw
	net-wireless/wireless-tools
	net-wireless/wpa_supplicant
	nfs? ( net-fs/nfs-utils )
	ntfs? ( sys-fs/ntfs3g )
	pax_kernel? ( sys-apps/elfix )
	pax_kernel? ( x11-misc/xdialog )
	reiser4? ( sys-fs/reiser4progs )
	reiser? ( sys-fs/reiserfsprogs )
	rxvt? ( x11-terms/rxvt-unicode )
	samba? ( || ( net-fs/cifs-utils net-fs/samba ) )
	squashfs? ( sys-fs/squashfs-tools )
	sys-apps/ethtool
	sys-apps/fbset
	sys-apps/gptfdisk
	sys-apps/hdparm
	sys-apps/iproute2
	sys-apps/lm_sensors
	sys-apps/mlocate
	sys-apps/pciutils
	sys-apps/pcmciautils
	sys-apps/pv
	sys-apps/rng-tools
	sys-apps/smartmontools
	sys-apps/usb_modeswitch
	sys-apps/usbutils
	sys-libs/gpm
	sys-power/hibernate-script
	sys-power/powertop
	sys-process/atop
	sys-process/htop
	sys-process/iotop
	sys-process/lsof
	sys-process/time
	thinkpad? ( app-laptop/thinkfan )
	udf? ( sys-fs/udftools )
	x11-misc/xdg-user-dirs
	x11-misc/xdg-user-dirs-gtk
	zfs? ( !livecd-stage1? ( amd64? ( !pax_kernel? ( sys-fs/zfs ) ) ) )
	|| ( ( virtual/service-manager ) ( sys-apps/sysvinit sys-apps/openrc ) )
	|| ( sys-process/vixie-cron virtual/cron )
	"

src_install() {
#	insinto /boot/grub
#	doins "${FILESDIR}"/bentoo.xpm.gz

	if use pax_kernel; then
		dosbin "${FILESDIR}"/toggle_hardened
		exeinto /root/Desktop/
		doexe "${FILESDIR}"/toggle_hardened.desktop
		exeinto /etc/skel/Desktop/
		newexe "${FILESDIR}"/sudo_toggle_hardened.desktop toggle_hardened.desktop
	fi

	# here is where we merge in things from root_overlay which make sense
	exeinto /root
	newexe "${FILESDIR}"/b43-commercial-${PV} b43-commercial
	exeinto /etc/skel
	newexe "${FILESDIR}"/b43-commercial-${PV} b43-commercial

	#/etc
	insinto /etc
	newins "${FILESDIR}"/motd-${PV} motd
	newins "${FILESDIR}"/issue.bentoo.logo issue.bentoo.logo

	if [ -r "${EROOT}"/etc/issue ]; then
		addwrite "${EROOT}"/etc # Disable the sandbox for this dir
		rm -f "${EROOT}"/etc/issue
		ln -s "${EROOT}"/etc/issue.bentoo.logo "${EROOT}"/etc/issue
	fi

	if [ ! -e "${EROOT}/etc/env.d/02locale" ]
	then
		doenvd "${FILESDIR}"/02locale
	fi

	insinto /etc/fonts
	doins "${FILESDIR}"/local.conf

	exeinto /etc/local.d
	doexe "${FILESDIR}"/00-linux_link.start
	newexe "${FILESDIR}"/00-speed_shutdown.stop 00-speed_shutdown.stop
	newexe "${FILESDIR}"/99-power_saving.start 99-power_saving.start
}
