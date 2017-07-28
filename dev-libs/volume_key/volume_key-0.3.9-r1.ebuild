# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

inherit eutils autotools

DESCRIPTION="library for manipulating and storing storage volume encryption keys"
HOMEPAGE="https://pagure.io/volume_key/"
SRC_URI="https://releases.pagure.org/${PN}/${P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-devel/autoconf:2.63"
RDEPEND="
	app-crypt/gpgme
	dev-libs/glib
	dev-libs/nss
	dev-libs/glib:2
	sys-devel/gettext
	sys-apps/util-linux"

src_prepare() {
	ipatch push . "${FILESDIR}/${P}-fips-crash.patch"
	ipatch push . "${FILESDIR}/${P}-config.h.patch"
	ipatch push . "${FILESDIR}/${P}-translation-updates.patch"
	eapply_user
	eautoreconf
}
