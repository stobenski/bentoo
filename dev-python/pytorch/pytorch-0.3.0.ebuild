# Copyright 1999-2018 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{5,6} )

inherit distutils-r1 git-r3

DESCRIPTION="Tensors and Dynamic neural networks in Python with strong GPU acceleration"
HOMEPAGE="http://pytorch.org"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/cffi
	dev-python/numpy
	dev-python/pyyaml
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-util/cmake"
#	sci-libs/mkl"

src_unpack() {
	default

	EGIT_CLONE_TYPE="mirror"

	EGIT_REPO_URI="https://github.com/facebookincubator/gloo"
	EGIT_CHECKOUT_DIR="${WORKDIR}/${P}/torch/lib/gloo"
	git-r3_src_unpack
	unset EGIT_REPO_URI EGIT_CHECKOUT_DIR

	EGIT_REPO_URI="https://github.com/pybind/pybind11"
	EGIT_CHECKOUT_DIR="${WORKDIR}/${P}/torch/lib/pybind11"
	git-r3_src_unpack
	unset EGIT_REPO_URI EGIT_CHECKOUT_DIR

	EGIT_REPO_URI="https://github.com/nanopb/nanopb"
	EGIT_CHECKOUT_DIR="${WORKDIR}/${P}/torch/lib/nanopb"
	git-r3_src_unpack
	unset EGIT_REPO_URI EGIT_CHECKOUT_DIR
}
