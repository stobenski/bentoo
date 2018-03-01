# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

DESCRIPTION="Bentoo meta ebuild to install all apps"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64 arm x86"

IUSE="plasma proxy"
DEPEND=""

RDEPEND=""

PDEPEND="
	plasma? ( bentoo/bentoo-plasma )
	proxy? ( bentoo/bentoo-proxy )
	bentoo/bentoo-system
	bentoo/bentoo-vim
"
