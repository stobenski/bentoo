# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{4,5,6}} )

inherit autotools python-r1

DESCRIPTION="Tiny library providing a C \"class\" for working with arbitrary big sizes in bytes"
HOMEPAGE="https://github.com/rhinstaller/libbytesize"
if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rhinstaller/libbytesize.git"
	KEYWORDS="~amd64 ~arm ~x86"
else
	SRC_URI="https://github.com/rhinstaller/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 arm x86"
fi

LICENSE="LGPL-2+"
SLOT="0"
IUSE="doc test"

RDEPEND="
	${PYTHON_DEPS}
	dev-libs/gmp:0=
	>=dev-libs/libpcre-8.32
"

DEPEND="
	${RDEPEND}
	sys-devel/gettext
	doc? ( dev-util/gtk-doc )
	test? (
		dev-python/pocketlint
		dev-python/polib
	)
"

RESTRICT="test"

pkg_setup() {
	python_setup
}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		--without-python3
		$(use_with doc gtk-doc)
	)
	econf "${myeconfargs[@]}"
}

src_install() {
	emake install DESTDIR="${D}"

	python_install() {
		emake -C src/python install DESTDIR="${D}"
		python_optimize
	}
	python_foreach_impl python_install
}
