# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit bash-completion-r1 python-r1 python-utils-r1 systemd udev

MY_PV="${PV/_p/_r}"
MY_P=${PN}-${MY_PV}

DESCRIPTION="Android platform tools (adb, fastboot, and mkbootimg)"
HOMEPAGE="https://android.googlesource.com/platform/system/core/+/android-${MY_PV}
https://android.googlesource.com/platform/system/extras/+/android-${MY_PV}
https://github.com/M0Rf30/android-udev-rules/releases"

core_commit="ac8169f45dc9e5332d3ec24d0b14f812668b0c8e" # ! android-${MY_PV} commit
android_udev_rules_commit="20180112" # ! Latest
SRC_URI="https://android.googlesource.com/platform/system/core/+archive/${core_commit}.tar.gz -> ${MY_P}-core.tar.gz
https://android.googlesource.com/platform/system/extras/+archive/android-${MY_PV}/ext4_utils.tar.gz -> ${MY_P}-extras-ext4_utils.tar.gz
https://android.googlesource.com/platform/system/extras/+archive/android-${MY_PV}/f2fs_utils.tar.gz -> ${MY_P}-extras-f2fs_utils.tar.gz
https://github.com/M0Rf30/android-udev-rules/raw/${android_udev_rules_commit}/51-android.rules -> 51-android-${android_udev_rules_commit}.rules"

# The entire source code is Apache-2.0, except for fastboot which is BSD-2.
LICENSE="Apache-2.0 BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~arm-linux ~x86-linux"
IUSE="python"

DEPEND="dev-cpp/gtest
	dev-libs/libpcre2:=
	sys-fs/f2fs-tools
	sys-libs/libselinux
	sys-libs/zlib:=
	virtual/libusb:1="
RDEPEND="${DEPEND}
	python? ( ${PYTHON_DEPS} )
	virtual/udev"

S="${WORKDIR}"

PATCHES=(
	"${FILESDIR}"/${P}-gcc7-snprintf.patch
	"${FILESDIR}"/${P}-openssl.patch
	"${FILESDIR}"/${P}-Makefile.patch
	"${FILESDIR}"/${P}-f2fs-tools-1.10.patch
)

src_unpack() {
	mkdir -p "${S}/system/core" && cd "${S}/system/core"
	tar xvzf "${DISTDIR}/${MY_P}-core.tar.gz" || die "unpacking ${MY_P}-core.tar.gz failed"
	mkdir -p "${S}/system/extras/ext4_utils" && cd "${S}/system/extras/ext4_utils"
	tar xvzf "${DISTDIR}/${MY_P}-extras-ext4_utils.tar.gz" || die "unpacking ${MY_P}-extras-ext4_utils.tar.gz failed"
	mkdir -p "${S}/system/extras/f2fs_utils" && cd "${S}/system/extras/f2fs_utils"
	tar xvzf "${DISTDIR}/${MY_P}-extras-f2fs_utils.tar.gz" || die "unpacking ${MY_P}-extras-f2fs_utils.tar.gz failed"

	cd "${S}"
}

src_install() {
	dobin system/core/adb/adb system/core/fastboot/fastboot
	dodoc system/core/adb/NOTICE system/core/adb/*.{txt,TXT} system/core/fastboot/README.md
	use python && python_foreach_impl python_doexe system/core/mkbootimg/mkbootimg
	# bash_completion.fastboot from https://git.archlinux.org/svntogit/community.git/snapshot/community-2b7f9774cc468205fec145e64e9103aee8e5c6f9.tar.gz
	newbashcomp "${FILESDIR}"/bash_completion.fastboot fastboot
	# udev rules
	udev_dorules "${DISTDIR}/51-android-${android_udev_rules_commit}.rules"
	# openrc init.d
	newinitd "${FILESDIR}/adb.initd" adb
	# systemd unit file
	systemd_dounit "${FILESDIR}"/adb.service
}

pkg_postinst() {
	udev_reload
	elog "Android Debug Bridge (adb) is a command-line tool used to communicate with and control"
	elog "Android device over a USB link from a computer. Fastboot is a command line tool used"
	elog "to directly flash the filesystem in Android devices from a host via USB."
	elog
}
