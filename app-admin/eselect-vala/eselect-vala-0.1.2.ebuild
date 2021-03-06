# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

DESCRIPTION="Eselect module to maintain vala compiler symlink"
HOMEPAGE="https://code.google.com/p/eselect-vala/"

SRC_URI="https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-admin/eselect
	dev-lang/vala"
DEPEND="${RDEPEND}
	>=sys-devel/m4-1.4.13"

DOCS="AUTHORS README"

src_install() {
	emake DESTDIR="${D}" install
	dodoc ${DOCS}
}
