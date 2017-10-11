# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

inherit user

DESCRIPTION="Grafana web application for Performance Co-Pilot (PCP)"
HOMEPAGE="http://pcp.io https://grafana.org https://github.com/performancecopilot/pcp-webapp-grafana"
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
	insinto /usr/share/pcp/webapps/grafana
	doins -r .
}

pkg_postinst() {
	elog "Grafana is an open source, feature rich metrics dashboard and graph"
	elog "editor.  This package provides a Grafana that uses the Performance"
	elog "Co-Pilot (PCP) as the data repository.  Other Grafana backends are"
	elog "not used."
	echo
	elog "URL: http://localhost:44323/grafana"
}
