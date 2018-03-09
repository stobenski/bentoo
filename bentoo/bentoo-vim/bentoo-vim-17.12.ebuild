# Copyright 1999-2018 The Bentoo Authors. All rights reserved
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

DESCRIPTION="Bentoo vim meta ebuild"
HOMEPAGE="https://bitbucket.org/redeyeteam/bentoo"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="amd64 arm x86"

IUSE="gtk qt"

S="${WORKDIR}"

LANGS="cs da de el en es fr he hu it nl pl pt ru"
for X in ${LANGS} ; do
	IUSE="${IUSE} linguas_${X}"
done

DEPEND=""
RDEPEND="${DEPEND}

	app-editors/vim
	app-vim/pathogen
	app-vim/syntastic
	gtk? ( app-editors/gvim )
	qt? ( app-editors/vim-qt )

	linguas_cs? ( app-vim/vim-spell-cs )
	linguas_da? ( app-vim/vim-spell-da )
	linguas_de? ( app-vim/vim-spell-de )
	linguas_el? ( app-vim/vim-spell-el )
	linguas_en? ( app-vim/vim-spell-en )
	linguas_es? ( app-vim/vim-spell-es )
	linguas_fr? ( app-vim/vim-spell-fr )
	linguas_he? ( app-vim/vim-spell-he )
	linguas_hu? ( app-vim/vim-spell-hu )
	linguas_it? ( app-vim/vim-spell-it )
	linguas_nl? ( app-vim/vim-spell-nl )
	linguas_pl? ( app-vim/vim-spell-pl )
	linguas_pt? ( app-vim/vim-spell-pt )
	linguas_ru? ( app-vim/vim-spell-ru )
	"

src_install() {
	insinto /root
	newins "${FILESDIR}"/vimrc .vimrc
}
