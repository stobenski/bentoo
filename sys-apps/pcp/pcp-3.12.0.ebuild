# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

PYTHON_COMPAT=(python{2_7,3_3})
inherit autotools user eutils python-any-r1

DESCRIPTION="Performance Co-Pilot, system performance and analysis framework"
HOMEPAGE="http://pcp.io"
SRC_URI="https://bintray.com/artifact/download/pcp/source/pcp-${PV}.src.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
LICENSE="LGPL-2.1+"
SLOT="0"
IUSE="+ssp +pie threads infiniband discovery systemd X qt5 python papi perfevent manager webapi doc json nutcracker snmp"

DEPEND=" systemd? ( sys-apps/systemd )
	X? ( x11-libs/libXt )
	qt5? ( dev-qt/qtsvg:5 )
	python? ( ${PYTHON_DEPS} )
	perfevent? ( dev-libs/libpfm )
	papi? ( dev-libs/papi )
	discovery? ( net-dns/avahi[dbus] )
	webapi? ( net-libs/libmicrohttpd[messages] )
	doc? ( app-text/xmlto )
	net-dns/avahi
	dev-util/systemtap
	sys-process/procps
	net-libs/libmicrohttpd
	x11-libs/cairo
	www-apps/pcp-webapp-blinkenlights
	www-apps/pcp-webapp-grafana
	www-apps/pcp-webapp-graphite
	www-apps/pcp-webapp-vector"

RDEPEND="${DEPEND}"

pkg_setup(){
	if [ -z "$(egetent group pcp 2>/dev/null)" ]; then
		enewgroup pcp
		einfo
		einfo "The group 'pcp' has been created. Any users you add to this"
		einfo "group have access to files created by the daemons."
		einfo
	fi

	if [ -z "$(egetent passwd pcp 2>/dev/null)" ]; then
		enewuser pcp -1    -1 /var/lib/pcp pcp
		einfo
		einfo "The user 'pcp' has been created."
		einfo
	fi
	use python && python-any-r1_pkg_setup
}

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	# Setting xmlto as default documentation generator
	use doc && export BOOK_TOOLCHAIN="xmlto"

	# Configuration flags
	local myconf="\
		--prefix=${ROOT}/usr \
		--sysconfdir=${ROOT}/etc \
		--localstatedir=${ROOT}/var \
		$(use_enable ssp) \
		$(use_enable pie) \
		$(use_with threads) \
		$(use_with infiniband) \
		$(use_with discovery) \
		$(use_with systemd) \
		$(use_with papi) \
		$(use_with perfevent) \
		$(use_with manager) \
		$(use_with webapi)"
	use json   && myconf+=" --with-pmdajson=yes" || myconf+=" --with-pmdajson=no"
	use nutcracker && myconf+=" --with-pmdanutcracker=yes" || myconf+=" --with-pmdanutcracker=no"
	use snmp   && myconf+=" --with-pmdasnmp=yes" || myconf+=" --with-pmdasnmp=no"
	use python && myconf+=" --with-python"
	use doc    && myconf+=" --with-books"
	use qt5    && myconf+=" --with-qt" || myconf+=" --without-qt"
	use X      && myconf+=" --with-x"
	econf $myconf
}

src_compile(){
	emake
}

src_install() {
	NO_CHOWN=true
	DIST_ROOT="${ROOT}"
	export NO_CHOWN DIST_ROOT
	emake install_pcp
	dodoc CHANGELOG README.md
}
