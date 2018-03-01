# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

inherit user

DESCRIPTION="Vector web application for Performance Co-Pilot (PCP)"
HOMEPAGE="http://vectoross.io https://github.com/performancecopilot/pcp-webapp-vector"
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
	insinto /usr/share/pcp/webapps/vector
	doins -r .
}

pkg_postinst() {
	elog "Vector web application for the Performance Co-Pilot (PCP)."
	echo
	elog "URL: http://localhost:44323/vector"
}
