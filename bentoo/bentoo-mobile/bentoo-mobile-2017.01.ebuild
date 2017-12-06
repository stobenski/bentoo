# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"
KEYWORDS="amd64 arm x86"
DESCRIPTION="Bentoo mobile meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"
SLOT="0"
LICENSE="metapackage"
IUSE="+android mediatek samsung"

DEPEND=""
RDEPEND="${DEPEND}
	android? ( dev-util/android-tools )
	mediatek? ( app-mobilephone/spflashtool )
	samsung? ( app-mobilephone/heimdall )
	"
