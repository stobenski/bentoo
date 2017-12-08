# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"
DESCRIPTION="Bentoo meta ebuild to install all apps"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"
KEYWORDS="amd64 arm x86"
SLOT="0"
LICENSE="metapackage"
IUSE="enlightenment exploit gnome kde lxqt mate +mobile +pelican proxie xfce wine cockpit steam"

DEPEND=""

RDEPEND=""

PDEPEND="
	bentoo/bentoo-acpi
	bentoo/bentoo-browser
	bentoo/bentoo-editors
	cockpit? ( sys-apps/cockpit sys-apps/tuned )
	enlightenment? ( bentoo/bentoo-enlightenment )
	exploit? ( bentoo/bentoo-exploit )
	gnome? ( bentoo/bentoo-gnome )
	kde? ( bentoo/bentoo-kde )
	lxqt? ( bentoo/bentoo-lxqt )
	mate? ( bentoo/bentoo-mate )
	mobile? ( bentoo/bentoo-mobile )
	pelican? ( bentoo/bentoo-pelican )
	proxie? ( bentoo/bentoo-proxies )
	steam? ( games-util/steam-launcher )
	wine? ( bentoo/bentoo-wine )
	xfce? ( bentoo/bentoo-xfce )
	bentoo/bentoo-system
"
