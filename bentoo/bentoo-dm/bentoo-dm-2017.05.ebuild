# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"
DESCRIPTION="Bentoo display managers meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"
KEYWORDS="amd64 arm x86"
SLOT="0"
LICENSE="metapackage"
IUSE="gnome kde X"

DEPEND=""
RDEPEND="${DEPEND}
	gnome? ( || ( x11-misc/lightdm[gnome,gtk] gnome-base/gdm ) )
	kde? ( || ( x11-misc/lightdm[qt5] x11-misc/sddm kde-base/kdm ) )
	X? ( x11-apps/xdm )
	"
