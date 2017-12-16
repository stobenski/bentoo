# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

DESCRIPTION="Bentoo xorg meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64 arm x86"

IUSE_INPUT_DEVICES="+evdev keyboard mouse synaptics"
IUSE_VIDEO_CARDS="nouveau nvidia intel"
IUSE="${IUSE_INPUT_DEVICES} vdpau ${IUSE_VIDEO_CARDS}"

S="${WORKDIR}"

DEPEND=""
RDEPEND="${DEPEND}
	x11-base/xorg-x11
	intel? ( x11-apps/intel-gpu-tools )
	nouveau? ( vdpau? ( sys-firmware/nouveau-firmware ) )
"

src_install() {
	insinto /etc/X11/xorg.conf.d

    use keyboard && newins "${FILESDIR}"/00-keyboard.conf 00-keyboard.conf
    use evdev && newins "${FILESDIR}"/10-evdev.conf 10-evdev.conf
	newins "${FILESDIR}"/10-monitor.conf 10-monitor.conf
    use mouse && newins "${FILESDIR}"/11-mouse.conf 11-mouse.conf
	newins "${FILESDIR}"/20-files.conf 20-files.conf
	if use intel; then
		newins "${FILESDIR}"/10-dri.conf 10-dri.conf
		newins "${FILESDIR}"/20-intel.conf 20-intel.conf
	fi
    use nouveau && newins "${FILESDIR}"/20-nouveau.conf 20-nouveau.conf
	if use nvidia; then
		newins "${FILESDIR}"/20-nvidia.conf 20-nvidia.conf
		newins "${FILESDIR}"/99-nvidia-ignoreabi.conf 99-nvidia-ignoreabi.conf
	fi
    use synaptics && newins "${FILESDIR}"/50-synaptics.conf 50-synaptics.conf
}
