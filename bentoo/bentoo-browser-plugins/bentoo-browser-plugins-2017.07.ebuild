# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"
DESCRIPTION="Browser plugins"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"
LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="chromium kde"

PDEPEND="
	chromium? (
		www-plugins/chrome-binary-plugins
	)
	kde? (
		kde-apps/konq-plugins
	)"
