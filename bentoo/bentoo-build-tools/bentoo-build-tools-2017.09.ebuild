# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI="6"

DESCRIPTION="Tools for building C and C++ programs."
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"
KEYWORDS="amd64 arm x86"
SLOT="0"
LICENSE="metapackage"

GCC_VER="7.2.0"
PYTHON_VER="2.7"

RDEPEND="app-arch/bzip2
	dev-lang/perl
	dev-lang/python:${PYTHON_VER}
	app-eselect/eselect-python
	sys-devel/autoconf-archive
	sys-devel/autoconf
	sys-devel/autogen
	sys-devel/automake
	sys-devel/binutils
	sys-devel/bison
	sys-devel/clang
	sys-devel/gcc:${GCC_VER}[cxx]
	sys-devel/gcc-config
	sys-devel/gettext
	sys-devel/libtool
	sys-devel/make"
#	sys-libs/libstdc++-v3" ?
DEPEND=""

pkg_postinst() {
	# Setup Python ${PYTHON_VER}
	eselect python set python${PYTHON_VER}
	# No need to set the GCC profile here, since it's done in base-gcc
}
