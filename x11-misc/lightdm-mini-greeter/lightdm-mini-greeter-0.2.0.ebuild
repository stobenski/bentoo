# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

inherit autotools

DESCRIPTION="A Minimal, Configurable, Single-User GTK3 LightDM Greeter"
HOMEPAGE="https://github.com/prikhi/lightdm-mini-greeter"
SRC_URI="https://github.com/prikhi/lightdm-mini-greeter/archive/${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-libs/gtk+:3
	>=x11-misc/lightdm-1.2.2"

RDEPEND=""

src_prepare() {
	eapply_user
}

src_configure() {
	./autogen.sh
	econf
}

src_install() {
	emake DESTDIR="${ED}" install
}
