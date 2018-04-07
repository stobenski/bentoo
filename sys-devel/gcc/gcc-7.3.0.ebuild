# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="5"

PATCH_VER="1.0"
#UCLIBC_VER="1.0"

inherit epatch toolchain

KEYWORDS="~amd64 ~arm ~mips ~ppc ~x86"

RDEPEND=""
DEPEND="${RDEPEND}
	elibc_glibc? ( >=sys-libs/glibc-2.13 )
	>=${CATEGORY}/binutils-2.20"

if [[ ${CATEGORY} != cross-* ]] ; then
	PDEPEND="${PDEPEND} elibc_glibc? ( >=sys-libs/glibc-2.13 )"
fi

src_prepare() {
	toolchain_src_prepare

	epatch "${FILESDIR}"/gcc-7.2.0-pr69728.patch

#	epatch "${FILESDIR}"/${PV}/gcc-stable-branch.patch
	epatch "${FILESDIR}"/${PV}/0001-Fix-stack-protection-issues.patch
	epatch "${FILESDIR}"/${PV}/openmp-vectorize.patch
	epatch "${FILESDIR}"/${PV}/fortran-vector.patch
	epatch "${FILESDIR}"/${PV}/optimize.patch
	epatch "${FILESDIR}"/${PV}/ipa-cp.patch
#	epatch "${FILESDIR}"/${PV}/max-is-safe-on-x86.patch
	epatch "${FILESDIR}"/${PV}/optimize-at-least-some.patch
	epatch "${FILESDIR}"/${PV}/gomp-relax.patch
	epatch "${FILESDIR}"/${PV}/distribute.patch
	epatch "${FILESDIR}"/${PV}/revert-regression.patch
	# simplified version of gcc 8 upstream patch
	epatch "${FILESDIR}"/${PV}/skylake.patch
	epatch "${FILESDIR}"/${PV}/pow-optimization.patch
	# backport from gcc 8
	epatch "${FILESDIR}"/${PV}/0001-Option-mprefer-avx256-added-for-Intel-AVX512-configu.patch
	epatch "${FILESDIR}"/${PV}/prefer-256.patch
	# simplified version of gcc 8 upstream patch
	epatch "${FILESDIR}"/${PV}/narrow-vpxor.patch
	# zero registers on ret to make ROP harder
	epatch "${FILESDIR}"/${PV}/zero-regs.patch
	# drop on next rebase
	epatch "${FILESDIR}"/${PV}/debug-fma.patch

	if use elibc_musl || [[ ${CATEGORY} = cross-*-musl* ]]; then
		epatch "${FILESDIR}"/6.3.0/cpu_indicator.patch
		epatch "${FILESDIR}"/7.1.0/posix_memalign.patch
	fi
}
