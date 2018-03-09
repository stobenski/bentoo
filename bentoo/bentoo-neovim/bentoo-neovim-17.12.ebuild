# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

DESCRIPTION="Bentoo neovim meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64 arm x86"

IUSE="qt"

S="${WORKDIR}"

DEPEND=""
RDEPEND="${DEPEND}

	app-editors/neovim
	qt? ( app-editors/neovim-qt )
	"
