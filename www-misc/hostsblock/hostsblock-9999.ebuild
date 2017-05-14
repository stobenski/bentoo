# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

inherit systemd

DESCRIPTION="A script and cronjob that downloads, sorts, and installs multiple ad- and malware-blocking hosts files."
HOMEPAGE="http://gaenserich.github.com/hostsblock/"
if [[ ${PV} == 9999* ]] ; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/gaenserich/hostsblock"
        KEYWORDS=""
else
        SRC_URI="https://github.com/gaenserich/${PN}/archive/${P}-1.tar.gz -> ${P}.tar.gz"
        S="${WORKDIR}/${PN}-${P}-1"
		KEYWORDS="~amd64"
fi

SRC_URI=""

LICENSE="GPL"
SLOT="0"
KEYWORDS=""
IUSE="+dnsmasq systemd"

DEPEND="app-shells/bash
	net-misc/curl
	sys-apps/grep
	sys-apps/sed
	sys-apps/coreutils
"

RDEPEND="${DEPEND}
	dnsmasq? ( net-dns/dnsmasq )
	app-arch/unzip
	app-arch/p7zip
	app-arch/gzip
	systemd? ( sys-apps/systemd )
"

S="${WORKDIR}/${P}"

src_prepere(){
	eapply_user
}

src_install() {
    exeinto ${ROOT}/usr/bin
    newexe ${S}/src/hostsblock.sh hostsblock
	newexe ${S}/src/hostsblock-urlcheck.sh hostsblock-urlcheck
	exeinto ${ROOT}/usr/lib
	newexe ${S}/src/hostsblock-common.sh hostsblock-common.sh
	insinto ${ROOT}/etc/hostsblock
	doins ${S}/conf/hostsblock.conf
	doins ${S}/conf/black.list
	doins ${S}/conf/white.list
#	doman ${S}/man/hostsblock.8
#	doman ${S}/man/hhostsblock-urlcheck.8
	systemd_dounit ${S}/systemd/hostsblock.{service,timer}
}
