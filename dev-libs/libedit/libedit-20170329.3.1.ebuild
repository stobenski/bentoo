# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

inherit autotools multilib-minimal toolchain-funcs

MY_PV=${PV/./-}
MY_P=${PN}-${MY_PV}

DESCRIPTION="BSD replacement for libreadline"
HOMEPAGE="http://thrysoee.dk/editline/"
SRC_URI="http://thrysoee.dk/editline/${MY_P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static-libs"

DEPEND=">=sys-libs/ncurses-5.9-r3[static-libs?,${MULTILIB_USEDEP}]
	!<=sys-freebsd/freebsd-lib-6.2_rc1"

RDEPEND=${DEPEND}

S="${WORKDIR}/${MY_P}"

PATCHES=(
	"${FILESDIR}/${P}-ncursesprivate.patch"
	"${FILESDIR}/${P}-el_fn_sh_complete.patch"
	"${FILESDIR}/${P}-tinfo.patch"
)

src_prepare() {
	default
	eautoreconf
}

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf \
		$(use_enable static-libs static) \
		--enable-widec \
		--enable-fast-install
}

multilib_src_install() {
	emake DESTDIR="${D}" install
	gen_usr_ldscript -a edit
}

multilib_src_install_all() {
	einstalldocs
	find "${D}" -name '*.la' -delete || die
	# file collission with sys-libs/readline
	rm "${ED%/}/usr/share/man/man3/history.3" || die
}
