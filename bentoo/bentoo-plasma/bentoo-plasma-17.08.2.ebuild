# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

DESCRIPTION="Bentoo plasma meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64 arm x86"

IUSE="addons bluetooth drkonqi filelight kamera kgpg kdialog kdeconnect kdepim\
 kmix kpat krusader ksystemlog kwalletmanager kwalletpam networkmanager okular\
 redshift telepathy touchpad wallpapers khelpcenter vault pulseaudio"

KLV="17.12.50"

DEPEND=""
RDEPEND="${DEPEND}
	bentoo/bentoo-x11
	( x11-misc/sddm kde-plasma/sddm-kcm )

	<kde-apps/ark-${KLV}
	<kde-apps/dolphin-${KLV}
	<kde-apps/dolphin-plugins-${KLV}
	<kde-apps/gwenview-${KLV}
	<kde-apps/kate-${KLV}
	<kde-apps/kcalc-${KLV}
	<kde-apps/konsole-${KLV}
	<kde-apps/spectacle-${KLV}

	<kde-plasma/breeze-${KLV}
	<kde-plasma/kactivitymanagerd-${KLV}
	<kde-plasma/kde-cli-tools-${KLV}
	<kde-plasma/kdecoration-${KLV}
	<kde-plasma/kgamma-${KLV}
	<kde-plasma/khotkeys-${KLV}
	<kde-plasma/kinfocenter-${KLV}
	<kde-plasma/kmenuedit-${KLV}
	<kde-plasma/kscreen-${KLV}
	<kde-plasma/kscreenlocker-${KLV}
	<kde-plasma/ksshaskpass-${KLV}
	<kde-plasma/ksysguard-${KLV}
	<kde-plasma/kwayland-integration-${KLV}
	<kde-plasma/kwin-${KLV}
	<kde-plasma/kwrited-${KLV}
	<kde-plasma/libkscreen-${KLV}
	<kde-plasma/libksysguard-${KLV}
	<kde-plasma/milou-${KLV}
	<kde-plasma/oxygen-${KLV}
	<kde-plasma/plasma-desktop-${KLV}
	<kde-plasma/plasma-integration-${KLV}
	<kde-plasma/plasma-workspace-${KLV}
	<kde-plasma/polkit-kde-agent-${KLV}
	<kde-plasma/powerdevil-${KLV}
	<kde-plasma/systemsettings-${KLV}
	<kde-plasma/user-manager-${KLV}

	addons? ( <kde-plasma/kdeplasma-addons-${KLV} )
	bluetooth? ( <kde-plasma/bluedevil-${KLV} )
	drkonqi? ( <kde-plasma/drkonqi-${KLV} )
	filelight? ( <kde-apps/filelight-${KLV} )
	kamera? ( <kde-apps/kamera-${KLV} )
	kdeconnect? ( kde-misc/kdeconnect )
	kdepim? ( <kde-apps/kdepim-meta-${KLV} )
	kdialog? ( <kde-apps/kdialog-${KLV} )
	kgpg? ( <kde-apps/kgpg-${KLV} )
	kmix? ( <kde-apps/kmix-${KLV} )
	kpat? ( <kde-apps/kpat-${KLV} )
	ksystemlog? ( <kde-apps/ksystemlog-${KLV} )
	kwalletmanager? ( <kde-apps/kwalletmanager-${KLV} )
	kwalletpam? ( <kde-plasma/kwallet-pam-${KLV} x11-misc/sddm[pam] )
	networkmanager? ( <kde-plasma/plasma-nm-${KLV} )
	okular? ( <kde-apps/okular-${KLV} )
	pulseaudio? ( <kde-plasma/plasma-pa-${KLV} )
	redshift? ( kde-misc/plasma-applet-redshift-control )
	telepathy? ( <kde-apps/plasma-telepathy-meta-${KLV} )
	touchpad? ( kde-plasma/plasma-desktop[touchpad] )
	khelpcenter? ( <kde-apps/khelpcenter-${KLV} )
	vault? ( <kde-plasma/plasma-vault-${KLV} )
	wallpapers? ( <kde-plasma/plasma-workspace-wallpapers-${KLV} )

	|| ( www-client/qupzilla www-client/falkon )
"

PDEPEND=""

pkg_postinst() {
	# Remember people where to find our project information
	elog "Please remember to look at https://wiki.gentoo.org/wiki/Project:KDE"
	elog "for information about the project and documentation."
}
