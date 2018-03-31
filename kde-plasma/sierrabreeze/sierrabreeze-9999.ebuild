# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="OSX-like window decoration for KDE Plasma written in C++"
HOMEPAGE="https://github.com/ishovkun/SierraBreeze"
EGIT_REPO_URI="https://github.com/ishovkun/SierraBreeze"
EGIT_BRANCH="master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"

RDEPEND="
	kde-frameworks/extra-cmake-modules
"
DEPEND="${RDEPEND}
"

# This is basically a 1-1 translation of the AUR package
# so thanks! https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=sierrabreeze-kwin-decoration-git
src_configure() {
	cmake-utils_src_configure -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DKDE_INSTALL_LIBDIR=lib \
            -DBUILD_TESTING=OFF \
            -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}
