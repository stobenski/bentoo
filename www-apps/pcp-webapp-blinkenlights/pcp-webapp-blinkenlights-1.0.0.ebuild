# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

inherit user

DESCRIPTION="Blinking lights web application for Performance Co-Pilot (PCP)"
HOMEPAGE="http://pcp.io https://github.com/performancecopilot/pcp-webapp-blinkenlights"
SRC_URI="https://github.com/performancecopilot/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}"

RESTRICT="test"

src_prepare() {
	eapply_user
}

src_install() {
	insinto /usr/share/pcp/webapps/blinkenlights
	doins -r .
}

pkg_postinst() {
	elog "Demo web application showing traffic lights that change colour" based
	elog "on the periodic evaluation of performance metric expressions."
	echo
	elog "URL: http://localhost:44323/blinkenlights"
}
