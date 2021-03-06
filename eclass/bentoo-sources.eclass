# Copyright 1999-2018 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

# @ECLASS: bentoo-sources.eclass
# This file is part of Bentoo project.
# @MAINTAINER:
# Andrey Ovcharov <sudormrfhalt@gmail.com>
# @AUTHOR:
# Original author: Andrey Ovcharov <sudormrfhalt@gmail.com> (09 Jan 2013)
# @LICENSE: http://www.gnu.org/licenses/gpl-3.0.html GNU GPL v3
# @BLURB: Eclass for building linux kernel.
# @DESCRIPTION:
# This eclass provides functionality and default ebuild variables for building
# linux kernel.

# The latest version of this software can be obtained here:
# https://bitbucket.org/redeyeteam/bentoo
# Bugs: https://bitbucket.org/redeyeteam/bentoo/issues
# Wiki: https://bitbucket.org/redeyeteam/bentoo/wiki

if [[ ${___ECLASS_ONCE_SRC_BENTOO} != "recur -_+^+_- spank" ]]; then
___ECLASS_ONCE_SRC_BENTOO="recur -_+^+_- spank"

case ${EAPI:-0} in
	[012345]) die "EAPI=\"${EAPI}\" is not supported" ;;
	[6]) EXPORT_FUNCTIONS src_unpack src_prepare src_compile src_install pkg_postinst
esac

# No need to run scanelf/strip on kernel sources/headers (bug #134453).
RESTRICT="mirror binchecks strip"

# @FUNCTION: detect_version
# @USAGE:
# @DESCRIPTION:
# this function will detect and set
# - VERSION: the kernel version (e.g 3 for 3.4.2)
# - PATCHLEVEL: the kernel patchlevel (e.g 4 for 3.4.2)
# - SUBLEVEL: the kernel sublevel (e.g 2 for 3.4.2)
# - KMV: the kernel major version (e.g 3.4 for 3.4.2)
# - KSV: the original kernel version (eg 2.6.0 for 2.6.0-test11)
# - KERNEL_URI
# - SKIP_UPDATE
# - EXTRAVERSION
detect_version() {
	OLDIFS="$IFS"
	VER="${PV}"
	IFS='.'
	set -- ${VER}
	IFS="${OLDIFS}"

	VERSION="${1}" # the kernel version (e.g 3 for 3.4.2)
	PATCHLEVEL="${2}" # the kernel patchlevel (e.g 4 for 3.4.2)
	SUBLEVEL="${3}" # the kernel sublevel (e.g 2 for 3.4.2)
	KMV="${1}.${2}" # the kernel major version (e.g 3.4 for 3.4.2)
	KSV="${1}.${2}.${3}" # the original kernel version (eg 2.6.0 for 2.6.0-test11)

	extension="xz"
	kversion="${KMV}"
	kname="linux-${kversion}.tar.${extension}"
	kurl="mirror://kernel/linux/kernel/v${VERSION}.x"
	KERNEL_URI="${KERNEL_URI} ${kurl}/${kname}"
	if [ "${SUBLEVEL}" != "0" ] && [ "${PV}" != "${KMV}" ]; then
		pname="patch-${PV}.${extension}"
		KERNEL_URI="${KERNEL_URI} ${kurl}/${pname}"
	else
		PV="${KMV}" # default PV=3.4.0 new PV=3.4
		SKIP_UPDATE=1
	fi

	# ebuild default values setup settings
	EXTRAVERSION=${EXTRAVERSION:-"-bentoo"}
	KV_FULL="${PVR}${EXTRAVERSION}"
	S="${WORKDIR}"/linux-"${KV_FULL}"
}

detect_version

DESCRIPTION="Full sources for the Linux kernel"
HOMEPAGE="http://www.kernel.org"
LICENSE="GPL-2 !deblob? ( linux-firmware )"
SRC_URI="${KERNEL_URI}"
SLOT=${SLOT:-${KMV}}
IUSE="brand deblob symlink"
KEYWORDS="alpha amd64 arm hppa ia64 mips ppc ppc64 s390 sh sparc x86"

: ${BR:=${BR:-"\x1b[0;01m"}}
: ${BLUE:=${BLUE:-"\x1b[34;01m"}}
: ${CYAN:=${CYAN:-"\x1b[36;01m"}}
: ${GREEN:=${GREEN:-"\x1b[32;01m"}}
: ${NORMAL:=${NORMAL:-"\x1b[0;0m"}}
: ${RED:=${RED:-"\x1b[31;01m"}}
: ${YELLOW:=${YELLOW:-"\x1b[33;01m"}}

DEPEND="app-arch/xz-utils
	sys-apps/sed
	sys-devel/autoconf
	sys-devel/ipatch
	sys-devel/make
	sys-devel/bc
	brand? ( media-fonts/iso_latin_1 )"
RDEPEND=""

# @FUNCTION: init_variables
# @INTERNAL
# @DESCRIPTION:
# Internal function initializing all variables.
# We define it in function scope so user can define
# all the variables before and after inherit.
init_variables() {
	: ${rm_unneeded_arch:=${rm_unneeded_arch_cfg:-no}} # rm_unneeded-arch=yes/no

	debug-print "${FUNCNAME}: rm_unneeded_arch=${rm_unneeded_arch}"
}

init_variables

# @FUNCTION: init_deblob
# @INTERNAL
# @DESCRIPTION:
# Internal function initializing deblob variables.
init_deblob() {	
	DEBLOB_PV="${KMV}"

	# deblob svn tag, default is -gnu, to change, use K_DEBLOB_TAG in ebuild
	K_DEBLOB_TAG=${K_DEBLOB_TAG:--gnu}
	DEBLOB_A="deblob-${DEBLOB_PV}"
	DEBLOB_CHECK_A="deblob-check-${DEBLOB_PV}"
	DEBLOB_HOMEPAGE="http://www.fsfla.org/svn/fsfla/software/linux-libre/releases/tags"
	DEBLOB_URI_PATH="${DEBLOB_PV}${K_DEBLOB_TAG}"
	DEBLOB_CHECK_URI="${DEBLOB_HOMEPAGE}/${DEBLOB_URI_PATH}/deblob-check -> ${DEBLOB_CHECK_A}"
	DEBLOB_URI="${DEBLOB_HOMEPAGE}/${DEBLOB_URI_PATH}/${DEBLOB_A}"
	HOMEPAGE="${HOMEPAGE} ${DEBLOB_HOMEPAGE}"
	KERNEL_URI="${KERNEL_URI}
		deblob? (
			${DEBLOB_URI}
			${DEBLOB_CHECK_URI}
		)"
}

init_deblob

# iternal function
#
# @FUNCTION: rm_crap
# @USAGE:
# @DESCRIPTION: Remove *.orig or *.rej files
rm_crap() {
	find "${S}" \( -name \*~ -o -name \*.orig -o -name \.*.orig -o -name \*.rej -o -name \*.old -o -name \.*.old \) -delete
}

# @FUNCTION: rand
# @USAGE:
# @DESCRIPTION:
# Return random number.
#
# Note that this function should not be used in the global scope.
rand() {
	printf $(($1*RANDOM/32767))
}

# @FUNCTION: rand_element
# @USAGE:
# @DESCRIPTION:
# Print fortune like random msg.
rand_element () {
	local -a th=("$@")
	unset th[0]
	printf $'%s\n' "${th[$(($(rand "${#th[*]}")+1))]}"
}

# @FUNCTION: get_config
# @USAGE:
# @DESCRIPTION:
get_config() {
	ebegin "Searching for best availiable kernel config"
		if [ -r "/proc/config.gz" ]; then test -d .config >/dev/null 2>&1 || zcat /proc/config.gz > .config
			einfo " ${BLUE}Found config from running kernel, updating to match target kernel${NORMAL}"
		elif [ -r "/boot/config-${FULLVER}" ]; then test -d .config >/dev/null 2>&1 || cat "/boot/config-${FULLVER}" > .config
			einfo " ${BLUE}Found${NORMAL} ${RED}/boot/config-${FULLVER}${NORMAL}"
		elif [ -r "/etc/portage/savedconfig/${CATEGORY}/${PN}/config" ]; then test -d .config >/dev/null 2>&1 || cat /etc/portage/savedconfig/${CATEGORY}/${PN}/config > .config
			einfo " ${BLUE}Found${NORMAL} ${RED}/etc/portage/savedconfig/${CATEGORY}/${PN}/config${NORMAL}"
		elif [ -r "/usr/src/linux/.config" ]; then test -d .config >/dev/null 2>&1 || cat /usr/src/linux/.config > .config
			einfo " ${BLUE}Found${NORMAL} ${RED}/usr/src/linux/.config${NORMAL}"
		elif [ -r "/usr/src/linux-${KV_FULL}/.config" ]; then test -d .config >/dev/null 2>&1 || cat /usr/src/linux-${KV_FULL}/.config > .config
			einfo " ${BLUE}Found${NORMAL} ${RED}/usr/src/linux-${KV_FULL}/.config${NORMAL}"
		else test -d .config >/dev/null 2>&1 || cp arch/${ARCH}/defconfig .config \
			einfo " ${BLUE}No suitable custom config found, defaulting to defconfig${NORMAL}"
		fi
	eend $?
}

# @FUNCTION: copy
# @USAGE:
# @DESCRIPTION:
copy() {
	[[ ${#} -ne 2 ]] && die "Invalid number of args to ${FUNCNAME}()";

	local src=${1}
	local dst=${2}

#	cp "${src}" "${dst}" || die "${RED}cp ${src} ${dst} failed${NORMAL}"
#	rsync -avhW --no-compress --progress "${src}" "${dst}" || die "${RED}rsync -avhW --no-compress --progress ${src} ${dst} failed${NORMAL}"
	test -d "${dst}" >/dev/null 2>&1 || mkdir -p "${dst}"; (cd "${src}"; tar cf - .) | (cd "${dst}"; tar xpf -) || die "${RED}cp ${src} ${dst} failed${NORMAL}"
}

# @FUNCTION: move
# @USAGE:
# @DESCRIPTION:
move() {
	[[ ${#} -ne 2 ]] && die "Invalid number of args to ${FUNCNAME}()";

	local src=${1}
	local dst=${2}

	(copy ${src} ${dst} >/dev/null 2>&1 && rm -rf "${src}") || die "${RED}mv ${src} ${dst} failed${NORMAL}"
}

# common functions
#==============================================================

# @FUNCTION: src_unpack
# @USAGE:
# @DESCRIPTION: Extract source packages and do any necessary patching or fixes.
bentoo-sources_src_unpack() {
	if [ "${A}" != "" ]; then
		ebegin "Extract ${kname}"
			tar xvJf "${PORTAGE_ACTUAL_DISTDIR:-${DISTDIR}}/${kname}" &>/dev/null
		eend $?
		cd "${WORKDIR}" || die "${RED}cd ${WORKDIR} failed${NORMAL}"
		mv "linux-${kversion}" "${S}" || die "${RED}mv linux-${kversion} ${S} failed${NORMAL}"
	fi
	cd "${S}" || die "${RED}cd ${S} failed${NORMAL}"
	if [ "${SKIP_UPDATE}" != "1"  ] ; then
		einfo "Update to latest upstream..."
		ipatch push . "${PORTAGE_ACTUAL_DISTDIR:-${DISTDIR}}/${pname}"
	else
		ewarn "${RED}Skipping update to latest upstream ...${NORMAL}"
	fi

	if use brand; then
		einfo "Apply bentoo branding patchset..."
		ipatch push . "${FILESDIR}/${KMV}/brand"
	fi

	if use deblob ; then
		cp "${PORTAGE_ACTUAL_DISTDIR:-${DISTDIR}}/${DEBLOB_A}" "${T}" || die "${RED}cp ${DEBLOB_A} failed${NORMAL}"
		cp "${PORTAGE_ACTUAL_DISTDIR:-${DISTDIR}}/${DEBLOB_CHECK_A}" "${T}/deblob-check" || die "${RED}cp ${DEBLOB_CHECK_A} failed${NORMAL}"
		chmod +x "${T}/${DEBLOB_A}" "${T}/deblob-check" || die "${RED}chmod deblob scripts failed${NORMAL}"
	fi
}

# @FUNCTION: src_prepare
# @USAGE:
# @DESCRIPTION: Prepare source packages and do any necessary patching or fixes.
bentoo-sources_src_prepare() {
	ebegin "Set extraversion in Makefile" # manually set extraversion
		sed -i -e "s:^\(EXTRAVERSION =\).*:\1 ${EXTRAVERSION}:" Makefile
	eend

	get_config

	case "${rm_unneeded_arch}" in
	yes)	ebegin "Remove unneeded architectures"
			if use x86 || use amd64; then
				rm -rf "${WORKDIR}"/linux-"${KV_FULL}"/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,nios2,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
				sed -i 's/include/#include/g' "${WORKDIR}"/linux-"${KV_FULL}"/fs/hostfs/Makefile
			else
				rm -rf "${WORKDIR}"/linux-"${KV_FULL}"/arch/{avr32,blackfin,c6x,cris,frv,h8300,hexagon,m32r,m68k,m68knommu,microblaze,mn10300,nios2,openrisc,score,tile,unicore32,um,v850,xtensa}
			fi
		eend $? ;;
	no)	ewarn "Skipping remove unneeded architectures ..." ;;
	esac

	ebegin "Compile ${RED}gen_init_cpio${NORMAL}"
		make -C "${WORKDIR}"/linux-"${KV_FULL}"/usr/ gen_init_cpio > /dev/null 2>&1
		chmod +x "${WORKDIR}"/linux-"${KV_FULL}"/usr/gen_init_cpio "${WORKDIR}"/linux-"${KV_FULL}"/scripts/gen_initramfs_list.sh > /dev/null 2>&1
	eend $?

	cd "${WORKDIR}"/linux-"${KV_FULL}" || die "${RED}cd ${WORKDIR}/linux-${KV_FULL} failed${NORMAL}"
	local GENTOOARCH="${ARCH}"
	unset ARCH

	ebegin "Running ${RED}make oldconfig${NORMAL}"
		make oldconfig </dev/null &>/dev/null
	eend $? "Failed oldconfig"

	ebegin "Running ${RED}modules_prepare${NORMAL}"
		make modules_prepare &>/dev/null
	eend $? "Failed ${RED}modules prepare${NORMAL}"

	ARCH="${GENTOOARCH}"

	echo
	einfo "${RED}$(rand_element "Bentoo is about choice" "Bentoo is about power" "Bentoo Rocks" "Thank you for using Bentoo. :)" "Are you actually trying to read this?" "How many times have you stared at this?" "We are generating the cache right now" "You are paying too much attention." "A theory is better than its explanation." "Phasers locked on target, Captain." "Thrashing is just virtual crashing." "To be is to program." "Real Users hate Real Programmers." "When all else fails, read the instructions." "Functionality breeds Contempt." "The future lies ahead." "3.1415926535897932384626433832795028841971694" "Sometimes insanity is the only alternative." "Inaccuracy saves a world of explanation." "Live long and prosper." "Initiating Self Destruct." "If you only know the power of the Dark Side!" "If you eliminate the impossible, whatever remains, however improbable, must be the truth!" "Enter ye in by the narrow gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many are they that enter in thereby." "知る者は言わず言う者は知らず")${NORMAL}"
	echo

	if [ -f tools/objtool/sync-check.sh ] ; then
		chmod +x tools/objtool/sync-check.sh
	fi

	eapply_user

	ebegin "Cleanup backups after patching"
		rm_crap
	eend $?
}

# @FUNCTION: src_compile
# @USAGE:
# @DESCRIPTION: Configure and build the package.
bentoo-sources_src_compile() {
	if use deblob ; then
		echo ">>> Running deblob script ..."
		sh "${T}/${DEBLOB_A}" --force || \
			die "${RED}Deblob script failed to run!!!${NORMAL}"
	fi
}

# @FUNCTION: src_install
# @USAGE:
# @DESCRIPTION: Install a package to ${D}
bentoo-sources_src_install() {
	local version_h_name="usr/src/linux-${KV_FULL}/include/linux"
	local version_h="${ROOT}${version_h_name}"

	if [ -f "${version_h}" ]; then
		einfo "Discarding previously installed version.h to avoid collisions"
		addwrite "/${version_h_name}"
		rm -f "${version_h}"
	fi

	cd "${S}" || die "${RED}cd ${S} failed${NORMAL}"
	dodir /usr/src
	echo ">>> Copying sources ..."
	move "${WORKDIR}/linux-${KV_FULL}" "${D}/usr/src/linux-${KV_FULL}"

	if use symlink; then
		if [ -h "/usr/src/linux" ]; then
			addwrite "/usr/src/linux"
			unlink "/usr/src/linux" || die "${RED}unlink /usr/src/linux failed${NORMAL}"
		elif [ -d "/usr/src/linux" ]; then
			move "/usr/src/linux" "/usr/src/linux-old"
		fi
		dosym linux-${KV_FULL} \
			"/usr/src/linux" ||
			die "${RED}cannot install kernel symlink${NORMAL}"
	fi
}

# @FUNCTION: pkg_postinst
# @USAGE:
# @DESCRIPTION: Called after image is installed to ${ROOT}
bentoo-sources_pkg_postinst() {
	einfo " ${BLUE}If you are upgrading from a previous kernel, you may be interested${NORMAL}${BR}
 ${BLUE}in the following document:${NORMAL}${BR}
 ${BLUE}- General upgrade guide:${NORMAL} ${RED}http://www.gentoo.org/doc/en/kernel-upgrade.xml${NORMAL}${BR}
 ${RED}${CATEGORY}/${PN}${NORMAL} ${BLUE}is UNSUPPORTED Gentoo Security.${NORMAL}${BR}
 ${BLUE}This means that it is likely to be vulnerable to recent security issues.${NORMAL}${BR}
 ${BLUE}For specific information on why this kernel is unsupported, please read:${NORMAL}${BR}
 ${RED}http://www.gentoo.org/proj/en/security/kernel.xml${NORMAL}${BR}
 ${BR}
 ${BLUE}Now is the time to configure and build the kernel.${NORMAL}${BR}"

	einfo "${BLUE}For more info about patchset’s, and how to report problems, see:${NORMAL}${BR}
${BR}${BLUE}Wiki:${NORMAL} ${RED}https://bitbucket.org/redeyeteam/bentoo/wiki${NORMAL}${BR}
${BLUE}Bugs:${NORMAL} ${RED}https://bitbucket.org/redeyeteam/bentoo/issues${NORMAL}${BR}"
}

fi
