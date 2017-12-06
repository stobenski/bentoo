# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"
KEYWORDS="amd64 arm x86"
DESCRIPTION="Bentoo mpv meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"
SLOT="0"
LICENSE="metapackage"
IUSE=""

S="${WORKDIR}"

DEPEND=""
RDEPEND="${DEPEND}
	media-video/mpv
	net-misc/youtube-dl
	"

src_install() {
	insinto /etc/mpv
	doins "${FILESDIR}"/input.conf || die "doins input.conf failed"
	doins "${FILESDIR}"/mpv.conf || die "doins mpv.conf failed"
}
