# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"
KEYWORDS="amd64 arm x86"
DESCRIPTION="Bentoo lxqt meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"
SLOT="0"
LICENSE="metapackage"
IUSE="bluetooth"

DEPEND=""
RDEPEND="${DEPEND}
	bentoo/bentoo-xorg
	bentoo/bentoo-dm

	lxqt-base/lxqt-meta
	bluetooth? ( net-wireless/blueman )
"

PDEPEND=""
