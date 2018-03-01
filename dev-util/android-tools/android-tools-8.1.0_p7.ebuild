# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"
inherit git-r3 systemd udev

KEYWORDS="~amd64 ~x86 ~arm-linux ~x86-linux"
DESCRIPTION="Android platform tools (adb and fastboot)"
HOMEPAGE="https://sites.google.com/a/android.com/tools/"
SRC_URI=""

MY_VER="${PV/p/r}"
MY_B="android-${MY_VER}"

# The entire source code is Apache-2.0, except for fastboot which is BSD.
LICENSE="Apache-2.0 BSD"
SLOT="0"
IUSE=""

RDEPEND="virtual/udev"

DEPEND="${RDEPEND}
	dev-cpp/gtest
	dev-libs/libusb
	dev-libs/libpcre
	sys-devel/ipatch
	sys-fs/f2fs-tools
	sys-libs/libselinux
	sys-libs/zlib"

S="${WORKDIR}"

src_unpack() {
	EGIT_CLONE_TYPE="mirror"

	local r
	for r in system/core system/extras; do
		EGIT_REPO_URI="https://android.googlesource.com/platform/${r}"
		EGIT_CHECKOUT_DIR="${WORKDIR}/${r}"
		EGIT_BRANCH="${MY_B}"
		EGIT_COMMIT="$EGIT_BRANCH"
		git-r3_src_unpack
		unset EGIT_REPO_URI EGIT_CHECKOUT_DIR EGIT_BRANCH EGIT_COMMIT
	done
}

src_prepare() {
	#ipatch push . "${FILESDIR}"/${P}-musl-fixes.patch
	ipatch push . "${FILESDIR}"/gcc7-snprintf.patch
	ipatch push . "${FILESDIR}"/openssl.patch
	ipatch push . "${FILESDIR}"/${P}-Makefile.patch

	eapply_user
}

src_install() {
	exeinto /usr/bin
	doexe "${WORKDIR}"/system/core/adb/adb
	doexe "${WORKDIR}"/system/core/fastboot/fastboot
	dodoc "${WORKDIR}"/system/core/adb/NOTICE "${WORKDIR}"/system/core/adb/{OVERVIEW,SERVICES,SYNC}.TXT
	# udev rules
	udev_dorules "${FILESDIR}"/51-android.rules
	# systemd unit file
	systemd_dounit "${FILESDIR}"/adb.service
}

pkg_postinst() {
	elog "Android Debug Bridge (adb) is a command-line tool used to communicate with and control"
	elog "Android device over a USB link from a computer. Fastboot is a command line tool used"
	elog "to directly flash the filesystem in Android devices from a host via USB."
	elog
}
