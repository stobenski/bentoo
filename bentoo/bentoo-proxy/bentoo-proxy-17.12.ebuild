# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

DESCRIPTION="Bentoo proxy meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"

IUSE=""
DEPEND=""

RDEPEND="${DEPEND}
	net-proxy/privoxy
	net-vpn/tor
	net-dns/dnscrypt-proxy
	net-dns/unbound
	"
