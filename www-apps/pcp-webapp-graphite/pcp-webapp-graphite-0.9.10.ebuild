# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

inherit user

DESCRIPTION="Graphite web application for Performance Co-Pilot (PCP)"
HOMEPAGE="http://graphite.readthedocs.org https://github.com/performancecopilot/pcp-webapp-graphite"
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
	insinto /usr/share/pcp/webapps/graphite
	doins -r .
}

pkg_postinst() {
	elog "Graphite is a highly scalable real-time graphing system. This package"
	elog "provides a graphite version that uses the Performance Co-Pilot (PCP)"
	elog "as the data repository, and Graphites web interface renders it. The"
	elog "Carbon and Whisper subsystems of Graphite are not included nor used."
}
