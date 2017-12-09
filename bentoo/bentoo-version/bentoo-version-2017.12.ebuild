# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

inherit multilib

DESCRIPTION="Bentoo system release virtual package"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

IUSE=""
DEPEND=""
# Listing default packages for the current release
RDEPEND="virtual/service-manager"

src_unpack () {
	echo "Bentoo Linux ${ARCH} ${PV}" > "${T}/bentoo-release"

	# Anaconda expects a "release" somewhere in the string
	# and no trailing \n
	echo -n "Bentoo ${ARCH} release ${PV}" > "${T}/system-release"
	mkdir -p "${S}" || die
}

src_install () {
	insinto /etc
	doins "${T}"/bentoo-release
	doins "${T}"/system-release

	# Bug 3459 - reduce the risk of fork bombs
	insinto /etc/security/limits.d
	doins "${FILESDIR}/00-bentoo-anti-fork-bomb.conf"
}
