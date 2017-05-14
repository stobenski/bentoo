# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

inherit eutils toolchain-funcs versionator multilib-minimal

MY_PV=$(get_major_version)-$(get_after_major_version)
MY_P=${PN}-${MY_PV}

DESCRIPTION="BSD replacement for libreadline"
HOMEPAGE="http://www.thrysoee.dk/editline/"
SRC_URI="http://www.thrysoee.dk/editline/${MY_P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"

KEYWORDS="~amd64 ~arm ~x86"
IUSE="examples static-libs"

DEPEND=">=sys-libs/ncurses-5.9-r3[static-libs?,${MULTILIB_USEDEP}]
	!<=sys-freebsd/freebsd-lib-6.2_rc1"

RDEPEND=${DEPEND}

S="${WORKDIR}/${MY_P}"

PATCHES=(
	"${FILESDIR}/${PN}-ncursesprivate.patch"
	)

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf \
		$(use_enable examples) \
		$(use_enable static-libs static) \
		--mandir=${EROOT}/usr/share/libedit \
		--enable-fast-install
}

multilib_src_install() {
	emake DESTDIR="${D}" install
	gen_usr_ldscript -a edit
}

multilib_src_install_all() {
	einstalldocs
	prune_libtool_files --all
}
