# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

DESCRIPTION="init_6 desktop meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="libreoffice +pelican +thinkpad virtualbox +vmware"

PDEPEND="
	bentoo/bentoo
	dev-util/meld
	games-engines/openmw
	games-sports/torcs
	games-strategy/warzone2100
	libreoffice? ( app-office/libreoffice )
	media-gfx/blender
	media-gfx/gimp
	media-video/mpv
	( net-im/bitlbee net-irc/irssi )
	pelican? ( app-text/pelican[markdown] =dev-python/beautifulsoup-4* )
	sys-block/gparted
	thinkpad? ( app-laptop/hdapsd app-laptop/tp_smapi sys-firmware/iwl6005-ucode )
	sys-kernel/buildkernel
	virtualbox? ( app-emulation/virtualbox-bin )
	vmware? ( app-emulation/vmware-player )
	x11-apps/mesa-progs
"
