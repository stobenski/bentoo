# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"
DESCRIPTION="Bentoo pelican meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"
KEYWORDS="amd64 arm x86"
SLOT="0"
LICENSE="metapackage"
IUSE=""

S="${WORKDIR}"

DEPEND=""
RDEPEND="${DEPEND}
	app-text/pelican[markdown]
	=dev-python/beautifulsoup-4*
	"
