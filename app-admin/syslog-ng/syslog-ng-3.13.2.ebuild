# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit autotools python-single-r1 eutils multilib systemd versionator

MY_PV=${PV/_/}
MY_PV_MM=$(get_version_component_range 1-2)
DESCRIPTION="syslog replacement with advanced filtering features"
HOMEPAGE="http://www.balabit.com/network-security/syslog-ng"
SRC_URI="https://github.com/balabit/syslog-ng/releases/download/${P}/${P}.tar.gz"

LICENSE="GPL-2+ LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="amqp caps dbi geoip http ipv6 json libressl mongodb pacct python redis smtp spoof-source systemd tcpd"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"
RESTRICT="test"

RDEPEND="
	amqp? ( >=net-libs/rabbitmq-c-0.8.0 )
	caps? ( sys-libs/libcap )
	dbi? ( >=dev-db/libdbi-0.9.0 )
	geoip? ( >=dev-libs/geoip-1.5.0 )
	http? ( net-misc/curl )
	json? ( >=dev-libs/json-c-0.9 )
	mongodb? ( >=dev-libs/mongo-c-driver-1.2.0 )
	python? ( ${PYTHON_DEPS} )
	redis? ( >=dev-libs/hiredis-0.11.0 )
	smtp? ( net-libs/libesmtp )
	spoof-source? ( net-libs/libnet:1.1 )
	systemd? ( sys-apps/systemd )
	tcpd? ( >=sys-apps/tcp-wrappers-7.6 )
	>=dev-libs/libpcre-6.1
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )
	!dev-libs/eventlog
	>=dev-libs/glib-2.10.1:2"
DEPEND="${RDEPEND}
	>=dev-libs/ivykis-0.36.1
	sys-devel/flex
	virtual/pkgconfig"

S=${WORKDIR}/${PN}-${MY_PV}

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	local f

	use python && python_fix_shebang .

	# remove bundled libs
	rm -rv lib/ivykis modules/afmongodb/mongo-c-driver modules/afamqp/rabbitmq-c || die

	if use !json ; then
		sed -i -e '/cim/d' scl/Makefile.am || die
		eautoreconf
	fi

	for f in "${FILESDIR}"/*logrotate*.in ; do
		local bn=$(basename "${f}")

		sed \
			-e "$(usex systemd \
				's/@GENTOO_RESTART@/systemctl kill -s HUP syslog-ng/' \
				's:@GENTOO_RESTART@:/etc/init.d/syslog-ng reload:')" \
			"${f}" > "${T}/${bn/.in/}" || die
	done

	default
}

src_configure() {
	econf \
		--disable-docs \
		--disable-java \
		--disable-java-modules \
		--disable-riemann \
		--enable-manpages \
		--localstatedir=/var/lib/syslog-ng \
		--sysconfdir=/etc/syslog-ng \
		--with-embedded-crypto \
		--with-ivykis=system \
		--with-module-dir=/usr/$(get_libdir)/syslog-ng \
		--with-pidfile-dir=/var/run \
		--with-systemdsystemunitdir="$(systemd_get_systemunitdir)" \
		$(use_enable amqp) \
		$(usex amqp --with-librabbitmq-client=system --without-librabbitmq-client) \
		$(use_enable caps linux-caps) \
		$(use_enable dbi sql) \
		$(use_enable geoip) \
		$(use_enable http) \
		$(use_enable ipv6) \
		$(use_enable json) \
		$(use_enable mongodb) \
		$(usex mongodb --with-mongoc=system "--without-mongoc --disable-legacy-mongodb-options") \
		$(use_enable pacct) \
		$(use_enable python) \
		$(use_enable redis) \
		$(use_enable smtp) \
		$(use_enable spoof-source) \
		$(use_enable systemd) \
		$(use_enable tcpd tcp-wrapper)
}

src_install() {
	emake DESTDIR="${D}" install

	dodoc AUTHORS NEWS.md CONTRIBUTING.md contrib/syslog-ng.conf* \
		contrib/syslog2ng "${FILESDIR}/${MY_PV_MM}/syslog-ng.conf.gentoo.hardened" \
		"${T}/syslog-ng.logrotate.hardened" "${FILESDIR}/README.hardened"

	# Install default configuration
	insinto /etc/syslog-ng
	if use userland_BSD ; then
		newins "${FILESDIR}/${MY_PV_MM}/syslog-ng.conf.gentoo.fbsd" syslog-ng.conf
	else
		newins "${FILESDIR}/${MY_PV_MM}/syslog-ng.conf.gentoo" syslog-ng.conf
	fi

	insinto /etc/logrotate.d
	newins "${T}/syslog-ng.logrotate" syslog-ng

	newinitd "${FILESDIR}/${MY_PV_MM}/syslog-ng.rc" syslog-ng
	newconfd "${FILESDIR}/${MY_PV_MM}/syslog-ng.confd" syslog-ng
	keepdir /etc/syslog-ng/patterndb.d /var/lib/syslog-ng
	prune_libtool_files --modules

	use python && python_optimize
}

pkg_postinst() {
	elog "For detailed documentation please see the upstream website:"
	elog "https://www.balabit.com/sites/default/files/documents/syslog-ng-ose-${MY_PV_MM}-guides/en/syslog-ng-ose-v${MY_PV_MM}-guide-admin/html/index.html"

	# bug #355257
	if ! has_version app-admin/logrotate ; then
		echo
		elog "It is highly recommended that app-admin/logrotate be emerged to"
		elog "manage the log files.  ${PN} installs a file in /etc/logrotate.d"
		elog "for logrotate to use."
		echo
	fi
}
