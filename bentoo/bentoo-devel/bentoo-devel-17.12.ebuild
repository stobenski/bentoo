# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

DESCRIPTION="Bentoo Development tools meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64 arm x86"

IUSE=""

DEPEND=""
RDEPEND="
	app-misc/pax-utils
	app-portage/eclass-manpages
	app-portage/eix
	app-portage/euses
	app-portage/gentoolkit
	app-portage/mirrorselect
	app-portage/overlint
	app-portage/portage-utils
	app-portage/repoman
	app-doc/pms
	dev-util/catalyst
	sys-apps/gentoo-functions
	sys-devel/crossdev
	sys-devel/ipatch
"
