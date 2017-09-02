# Copyright 1999-2017 The Bentoo Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v3 or later

EAPI=6

if [[ ${PV} == 9999  ]]; then
	GRUB_AUTOGEN=1
fi

if [[ -n ${GRUB_AUTOGEN} ]]; then
	PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )
	WANT_LIBTOOL=none
	inherit autotools python-any-r1
fi

inherit autotools bash-completion-r1 flag-o-matic multibuild pax-utils toolchain-funcs versionator

if [[ ${PV} != 9999 ]]; then
	if [[ ${PV} == *_alpha* || ${PV} == *_beta* || ${PV} == *_rc* ]]; then
		# The quote style is to work with <=bash-4.2 and >=bash-4.3 #503860
		MY_P=${P/_/'~'}
		SRC_URI="mirror://gnu-alpha/${PN}/${MY_P}.tar.xz"
		S=${WORKDIR}/${MY_P}
	else
		SRC_URI="mirror://gnu/${PN}/${P}.tar.xz"
		S=${WORKDIR}/${P%_*}
	fi
	KEYWORDS="amd64 ~arm64 x86"
else
	inherit git-r3
	EGIT_REPO_URI="git://git.sv.gnu.org/grub.git
		http://git.savannah.gnu.org/r/grub.git"
fi

PATCHES=(
	"${FILESDIR}"/gfxpayload.patch
	"${FILESDIR}"/grub-2.02_beta2-KERNEL_GLOBS.patch
	"${FILESDIR}"/0001-Bump-version-to-2.03.patch
	"${FILESDIR}"/0002-Remove-bashisms-from-tests.patch
	"${FILESDIR}"/0003-fs-tester-make-sh-compatible.patch
	"${FILESDIR}"/0004-support-busybox-date.patch
	"${FILESDIR}"/0005-Don-t-retrieve-fstime-when-it-s-not-useful.patch
	"${FILESDIR}"/0006-Support-lseek64.patch
	"${FILESDIR}"/0007-Use-SHELL-rather-than-bin-sh.patch
	"${FILESDIR}"/0008-po-Use-SHELL-rather-than-bin-sh.patch
	"${FILESDIR}"/0009-Add-termux-path-to-dict.patch
	"${FILESDIR}"/0010-Fix-shebang-for-termux.patch
	"${FILESDIR}"/0012-strtoull-Fix-behaviour-on-chars-between-9-and-a.patch
	"${FILESDIR}"/0013-Add-Virtual-LAN-support.patch
	"${FILESDIR}"/0014-mkimage-Pass-layout-to-mkimage_generate_elfXX-rather.patch
	"${FILESDIR}"/0015-Refactor-arm-uboot-code-to-make-it-genereic.patch
	"${FILESDIR}"/0016-coreboot-Split-parts-that-are-platform-independent.patch
	"${FILESDIR}"/0017-Rename-uboot-halt.c-to-dummy-halt.c.patch
	"${FILESDIR}"/0018-Rename-uboot-datetime-to-dummy-datetime.patch
	"${FILESDIR}"/0019-arm-coreboot-Start-new-port.patch
	"${FILESDIR}"/0020-Add-support-for-device-tree-based-drivers.patch
	"${FILESDIR}"/0021-arm-coreboot-Support-for-vexpress-timer.patch
	"${FILESDIR}"/0022-arm-coreboot-Export-FDT-routines.patch
	"${FILESDIR}"/0023-at_keyboard-Split-protocol-from-controller-code.patch
	"${FILESDIR}"/0024-arm_coreboot-Support-keyboard-for-vexpress.patch
	"${FILESDIR}"/0025-arm_coreboot-Support-grub-mkstandalone.patch
	"${FILESDIR}"/0026-arm_coreboot-Support-loading-linux-images.patch
	"${FILESDIR}"/0027-arm_coreboot-Support-DMA.patch
	"${FILESDIR}"/0028-ehci-Split-core-code-from-PCI-part.patch
	"${FILESDIR}"/0029-arm_coreboot-Support-EHCI.patch
	"${FILESDIR}"/0030-Fix-bug-on-FDT-nodes-with-compatible-property.patch
	"${FILESDIR}"/0031-fdtbus-Add-ability-to-send-receive-messages-on-paren.patch
	"${FILESDIR}"/0032-rk3288_spi-Add-SPI-driver.patch
	"${FILESDIR}"/0033-arm_coreboot-Add-Chromebook-keyboard-driver.patch
	"${FILESDIR}"/0034-Missing-parts-of-previous-commit.patch
	"${FILESDIR}"/0035-coreboot-Changed-cbmemc-to-support-updated-console-f.patch
	"${FILESDIR}"/0036-at_keyboard-Fix-falco-chromebook-case.patch
	"${FILESDIR}"/0037-sparc64-Close-cdboot-ihandle.patch
	"${FILESDIR}"/0038-arm64-xen_boot-Fix-Xen-boot-using-GRUB2-on-AARCH64.patch
	"${FILESDIR}"/0039-arm64-Add-nounzip-option-support-in-xen_module-comma.patch
	"${FILESDIR}"/0040-util-grub.d-20_linux_xen.in-Add-xen_boot-command-sup.patch
	"${FILESDIR}"/0041-arm64-Update-the-introduction-of-Xen-boot-commands-i.patch
	"${FILESDIR}"/0042-sparc64-Don-t-use-devspec-to-determine-the-OBP-path.patch
	"${FILESDIR}"/0043-Allow-GRUB-to-mount-ext2-3-4-filesystems-that-have-t.patch
	"${FILESDIR}"/0044-ehci-Fix-compilation-for-amd64.patch
	"${FILESDIR}"/0045-cache-Fix-compilation-for-ppc-sparc-and-arm64.patch
	"${FILESDIR}"/0046-ehci-Fix-compilation-on-i386.patch
	"${FILESDIR}"/0047-crypto-Fix-use-after-free.patch
	"${FILESDIR}"/0048-arm-efi-Fix-compilation.patch
	"${FILESDIR}"/0049-fdt-silence-clang-warning.patch
	"${FILESDIR}"/0050-Fix-a-segfault-in-lsefi.patch
	"${FILESDIR}"/0051-zfs-remove-size_t-typedef-and-use-grub_size_t-instea.patch
	"${FILESDIR}"/0052-udf-Fix-reading-label-lvd.ident-is-dstring.patch
	"${FILESDIR}"/0053-grub-core-fs-udf.c-Add-support-for-UUID.patch
	"${FILESDIR}"/0054-mkrescue-Check-xorriso-presence-before-doing-anythin.patch
	"${FILESDIR}"/0055-Fail-if-xorriso-failed.patch
	"${FILESDIR}"/0056-efi-refactor-grub_efi_allocate_pages.patch
	"${FILESDIR}"/0057-Remove-grub_efi_allocate_pages.patch
	"${FILESDIR}"/0058-efi-move-fdt-helper-library.patch
	"${FILESDIR}"/0059-efi-Add-GRUB_PE32_MAGIC-definition.patch
	"${FILESDIR}"/0060-arm64-linux-loader-improve-type-portability.patch
	"${FILESDIR}"/0061-efi-change-heap-allocation-type-to-GRUB_EFI_LOADER_C.patch
	"${FILESDIR}"/0062-core-use-GRUB_TERM_-definitions-when-handling-term-c.patch
	"${FILESDIR}"/0063-io-add-a-GRUB_GZ-prefix-to-gzio-specific-defines.patch
	"${FILESDIR}"/0064-info-in-builddir.patch
#	"${FILESDIR}"/0065-re-write-.gitignore.patch
	"${FILESDIR}"/0066-IBM-client-architecture-CAS-reboot-support.patch
	"${FILESDIR}"/0067-for-ppc-reset-console-display-attr-when-clear-screen.patch
	"${FILESDIR}"/0068-Disable-GRUB-video-support-for-IBM-power-machines.patch
	"${FILESDIR}"/0069-Honor-a-symlink-when-generating-configuration-by-gru.patch
	"${FILESDIR}"/0070-Move-bash-completion-script-922997.patch
	"${FILESDIR}"/0071-Update-to-minilzo-2.08.patch
	"${FILESDIR}"/0072-Allow-fallback-to-include-entries-by-title-not-just-.patch
	"${FILESDIR}"/0073-Add-GRUB_DISABLE_UUID.patch
	"${FILESDIR}"/0074-Make-exit-take-a-return-code.patch
	"${FILESDIR}"/0075-Mark-po-exclude.pot-as-binary-so-git-won-t-try-to-di.patch
	"${FILESDIR}"/0076-Make-efi-machines-load-an-env-block-from-a-variable.patch
	"${FILESDIR}"/0077-DHCP-client-ID-and-UUID-options-added.patch
	"${FILESDIR}"/0078-trim-arp-packets-with-abnormal-size.patch
	"${FILESDIR}"/0079-Fix-bad-test-on-GRUB_DISABLE_SUBMENU.patch
	"${FILESDIR}"/0080-Add-support-for-UEFI-operating-systems-returned-by-o.patch
	"${FILESDIR}"/0081-Migrate-PPC-from-Yaboot-to-Grub2.patch
	"${FILESDIR}"/0082-Add-fw_path-variable-revised.patch
	"${FILESDIR}"/0083-Add-support-for-linuxefi.patch
	"${FILESDIR}"/0084-Use-linuxefi-and-initrdefi-where-appropriate.patch
	"${FILESDIR}"/0085-Don-t-allow-insmod-when-secure-boot-is-enabled.patch
	"${FILESDIR}"/0086-Pass-x-hex-hex-straight-through-unmolested.patch
	"${FILESDIR}"/0087-Add-X-option-to-printf-functions.patch
	"${FILESDIR}"/0088-Search-for-specific-config-file-for-netboot.patch
	"${FILESDIR}"/0089-blscfg-add-blscfg-module-to-parse-Boot-Loader-Specif.patch
	"${FILESDIR}"/0090-Don-t-write-messages-to-the-screen.patch
	"${FILESDIR}"/0091-Don-t-print-GNU-GRUB-header.patch
	"${FILESDIR}"/0092-Don-t-add-to-highlighted-row.patch
	"${FILESDIR}"/0093-Message-string-cleanups.patch
	"${FILESDIR}"/0094-Fix-border-spacing-now-that-we-aren-t-displaying-it.patch
	"${FILESDIR}"/0095-Use-the-correct-indentation-for-the-term-help-text.patch
	"${FILESDIR}"/0096-Indent-menu-entries.patch
	"${FILESDIR}"/0097-Fix-margins.patch
	"${FILESDIR}"/0098-Use-2-instead-of-1-for-our-right-hand-margin-so-line.patch
	"${FILESDIR}"/0099-Use-linux16-when-appropriate-880840.patch
	"${FILESDIR}"/0100-Enable-pager-by-default.-985860.patch
	"${FILESDIR}"/0101-F10-doesn-t-work-on-serial-so-don-t-tell-the-user-to.patch
	"${FILESDIR}"/0102-Don-t-say-GNU-Linux-in-generated-menus.patch
	"${FILESDIR}"/0103-Don-t-draw-a-border-around-the-menu.patch
	"${FILESDIR}"/0104-Use-the-standard-margin-for-the-timeout-string.patch
	"${FILESDIR}"/0105-Add-.eh_frame-to-list-of-relocations-stripped.patch
	"${FILESDIR}"/0106-Make-10_linux-work-with-our-changes-for-linux16-and-.patch
	"${FILESDIR}"/0107-Don-t-print-during-fdt-loading-method.patch
	"${FILESDIR}"/0108-Don-t-munge-raw-spaces-when-we-re-doing-our-cmdline-.patch
	"${FILESDIR}"/0109-Don-t-require-a-password-to-boot-entries-generated-b.patch
	"${FILESDIR}"/0110-Don-t-emit-Booting-.-message.patch
	"${FILESDIR}"/0111-Replace-a-lot-of-man-pages-with-slightly-nicer-ones.patch
	"${FILESDIR}"/0112-use-fw_path-prefix-when-fallback-searching-for-grub-.patch
	"${FILESDIR}"/0113-Try-mac-guid-etc-before-grub.cfg-on-tftp-config-file.patch
	"${FILESDIR}"/0114-Fix-convert-function-to-support-NVMe-devices.patch
	"${FILESDIR}"/0115-Switch-to-use-APM-Mustang-device-tree-for-hardware-t.patch
	"${FILESDIR}"/0116-Use-the-default-device-tree-from-the-grub-default-fi.patch
	"${FILESDIR}"/0117-reopen-SNP-protocol-for-exclusive-use-by-grub.patch
	"${FILESDIR}"/0118-Revert-reopen-SNP-protocol-for-exclusive-use-by-grub.patch
	"${FILESDIR}"/0119-Add-grub_util_readlink.patch
	"${FILESDIR}"/0120-Make-editenv-chase-symlinks-including-those-across-d.patch
	"${FILESDIR}"/0121-Generate-OS-and-CLASS-in-10_linux-from-etc-os-releas.patch
	"${FILESDIR}"/0122-Minimize-the-sort-ordering-for-.debug-and-rescue-ker.patch
	"${FILESDIR}"/0123-Load-arm-with-SB-enabled.patch
	"${FILESDIR}"/0124-Try-prefix-if-fw_path-doesn-t-work.patch
	"${FILESDIR}"/0125-Update-info-with-grub.cfg-netboot-selection-order-11.patch
#	"${FILESDIR}"/0126-Use-Distribution-Package-Sort-for-grub2-mkconfig-112.patch
	"${FILESDIR}"/0127-Handle-rssd-storage-devices.patch
	"${FILESDIR}"/0128-Try-to-emit-linux16-initrd16-and-linuxefi-initrdefi-.patch
	"${FILESDIR}"/0129-Make-grub2-mkconfig-construct-titles-that-look-like-.patch
#	"${FILESDIR}"/0130-Add-friendly-grub2-password-config-tool-985962.patch
	"${FILESDIR}"/0131-calibrate_tsc-use-the-Stall-EFI-boot-service-on-GRUB.patch
	"${FILESDIR}"/0132-Make-grub2-mkconfig-construct-titles-that-look-like-.patch
#	"${FILESDIR}"/0133-Try-to-make-sure-configure.ac-and-grub-rpm-sort-play.patch
	"${FILESDIR}"/0134-tcp-add-window-scaling-support.patch
	"${FILESDIR}"/0135-efinet-retransmit-if-our-device-is-busy.patch
	"${FILESDIR}"/0136-Be-more-aggro-about-actually-using-the-configured-ne.patch
	"${FILESDIR}"/0137-efinet-add-filter-for-the-first-exclusive-reopen-of-.patch
	"${FILESDIR}"/0138-Fix-security-issue-when-reading-username-and-passwor.patch
#	"${FILESDIR}"/0139-Warn-if-grub-password-will-not-be-read-1290803.patch
#	"${FILESDIR}"/0140-Clean-up-grub-setpassword-documentation-1290799.patch
#	"${FILESDIR}"/0141-Fix-locale-issue-in-grub-setpassword-1294243.patch
	"${FILESDIR}"/0142-efiemu-Handle-persistent-RAM-and-unknown-possible-fu.patch
	"${FILESDIR}"/0143-efiemu-Fix-compilation-failure.patch
	"${FILESDIR}"/0144-Revert-reopen-SNP-protocol-for-exclusive-use-by-grub.patch
	"${FILESDIR}"/0145-Add-a-url-parser.patch
	"${FILESDIR}"/0146-efinet-and-bootp-add-support-for-dhcpv6.patch
#	"${FILESDIR}"/0147-Add-grub-get-kernel-settings-and-use-it-in-10_linux.patch
	"${FILESDIR}"/0148-Normalize-slashes-in-tftp-paths.patch
	"${FILESDIR}"/0149-Fix-malformed-tftp-packets.patch
	"${FILESDIR}"/0150-Fix-race-in-EFI-validation.patch
	"${FILESDIR}"/0151-bz1374141-fix-incorrect-mask-for-ppc64.patch
	"${FILESDIR}"/0152-Use-device-part-of-chainloader-target-if-present.patch
	"${FILESDIR}"/0153-Add-secureboot-support-on-efi-chainloader.patch
	"${FILESDIR}"/0154-Make-any-of-the-loaders-that-link-in-efi-mode-honor-.patch
	"${FILESDIR}"/0155-Make-grub_fatal-also-backtrace.patch
	"${FILESDIR}"/0156-Rework-linux-command.patch
	"${FILESDIR}"/0157-Rework-linux16-command.patch
	"${FILESDIR}"/0158-Make-grub-editenv-build-again.patch
	"${FILESDIR}"/0159-Fix-up-some-man-pages-rpmdiff-noticed.patch
	"${FILESDIR}"/0160-Re-work-some-intricacies-of-PE-loading.patch
	"${FILESDIR}"/0161-Rework-even-more-of-efi-chainload-so-non-sb-cases-wo.patch
	"${FILESDIR}"/0162-linuxefi-fix-double-free-on-verification-failure.patch
	"${FILESDIR}"/0163-fix-machine-type-test-in-30_os-prober.in.patch
	"${FILESDIR}"/0164-efi-chainloader-fix-wrong-sanity-check-in-relocate_c.patch
	"${FILESDIR}"/0165-efi-chainloader-truncate-overlong-relocation-section.patch
	"${FILESDIR}"/0166-linuxefi-minor-cleanups.patch
	"${FILESDIR}"/0167-Handle-multi-arch-64-on-32-boot-in-linuxefi-loader.patch
	"${FILESDIR}"/0168-Fix-up-linux-params-usage.patch
	"${FILESDIR}"/0169-Make-exit-take-a-return-code.patch
	"${FILESDIR}"/0170-arm64-make-sure-fdt-has-address-cells-and-size-cells.patch
	"${FILESDIR}"/0171-Add-some-grub_dprintf-in-the-secure-boot-verify-code.patch
	"${FILESDIR}"/0172-Make-our-info-pages-say-grub2-where-appropriate.patch
	"${FILESDIR}"/0173-print-more-debug-info-in-our-module-loader.patch
	"${FILESDIR}"/0174-macos-just-build-chainloader-entries-don-t-try-any-x.patch
	"${FILESDIR}"/0175-grub2-btrfs-Add-ability-to-boot-from-subvolumes.patch
	"${FILESDIR}"/0176-export-btrfs_subvol-and-btrfs_subvolid.patch
	"${FILESDIR}"/0177-grub2-btrfs-03-follow_default.patch
	"${FILESDIR}"/0178-grub2-btrfs-04-grub2-install.patch
	"${FILESDIR}"/0179-grub2-btrfs-05-grub2-mkconfig.patch
	"${FILESDIR}"/0180-grub2-btrfs-06-subvol-mount.patch
	"${FILESDIR}"/0181-No-more-Bootable-Snapshot-submenu-in-grub.cfg.patch
	"${FILESDIR}"/0182-Fallback-to-old-subvol-name-scheme-to-support-old-sn.patch
	"${FILESDIR}"/0183-Grub-not-working-correctly-with-btrfs-snapshots-bsc-.patch
	"${FILESDIR}"/0184-Add-grub_efi_allocate_pool-and-grub_efi_free_pool-wr.patch
	"${FILESDIR}"/0185-Use-grub_efi_.-memory-helpers-where-reasonable.patch
	"${FILESDIR}"/0186-Add-PRIxGRUB_EFI_STATUS-and-use-it.patch
	"${FILESDIR}"/0187-Don-t-use-dynamic-sized-arrays-since-we-don-t-build-.patch
	"${FILESDIR}"/0188-don-t-ignore-const.patch
	"${FILESDIR}"/0189-don-t-use-int-for-efi-status.patch
	"${FILESDIR}"/0190-make-GRUB_MOD_INIT-declare-its-function-prototypes.patch
	"${FILESDIR}"/0191-Clean-up-some-errors-in-the-linuxefi-loader.patch
	"${FILESDIR}"/0192-editenv-handle-relative-symlinks.patch
	"${FILESDIR}"/0193-Make-libgrub.pp-depend-on-config-util.h.patch
	"${FILESDIR}"/0194-Don-t-guess-boot-efi-as-HFS-on-ppc-machines-in-grub-.patch
	"${FILESDIR}"/10001-Put-the-correct-.file-directives-in-our-.S-files.patch
	"${FILESDIR}"/10002-Make-it-possible-to-enabled-build-id-sha1.patch
	"${FILESDIR}"/10004-Add-grub_qdprintf-grub_dprintf-without-the-file-lin.patch
	"${FILESDIR}"/10005-Make-a-gdb-dprintf-that-tells-us-load-addresses.patch
)

DEJAVU=dejavu-sans-ttf-2.37
UNIFONT=unifont-9.0.06
SRC_URI+=" fonts? ( mirror://gnu/unifont/${UNIFONT}/${UNIFONT}.pcf.gz )
	themes? ( mirror://sourceforge/dejavu/${DEJAVU}.zip )"

DESCRIPTION="GNU GRUB boot loader"
HOMEPAGE="https://www.gnu.org/software/grub/"

# Includes licenses for dejavu and unifont
LICENSE="GPL-3 fonts? ( GPL-2-with-font-exception ) themes? ( BitstreamVera )"
SLOT="2/${PVR}"
IUSE="debug device-mapper doc efiemu +fonts mount multislot nls static sdl test +themes truetype libzfs"

GRUB_ALL_PLATFORMS=( coreboot efi-32 efi-64 emu ieee1275 loongson multiboot qemu qemu-mips pc uboot xen xen-32 )
IUSE+=" ${GRUB_ALL_PLATFORMS[@]/#/grub_platforms_}"

REQUIRED_USE="
	grub_platforms_coreboot? ( fonts )
	grub_platforms_qemu? ( fonts )
	grub_platforms_ieee1275? ( fonts )
	grub_platforms_loongson? ( fonts )
"

# os-prober: Used on runtime to detect other OSes
# xorriso (dev-libs/libisoburn): Used on runtime for mkrescue
RDEPEND="
	app-arch/xz-utils
	>=sys-libs/ncurses-5.2-r5:0=
	debug? (
		sdl? ( media-libs/libsdl )
	)
	device-mapper? ( >=sys-fs/lvm2-2.02.45 )
	libzfs? ( sys-fs/zfs )
	mount? ( sys-fs/fuse )
	truetype? ( media-libs/freetype:2= )
	ppc? ( sys-apps/ibm-powerpc-utils sys-apps/powerpc-utils )
	ppc64? ( sys-apps/ibm-powerpc-utils sys-apps/powerpc-utils )
"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	app-misc/pax-utils
	sys-devel/flex
	sys-devel/bison
	sys-apps/help2man
	sys-apps/texinfo
	fonts? ( media-libs/freetype:2 )
	grub_platforms_xen? ( app-emulation/xen-tools:= )
	grub_platforms_xen-32? ( app-emulation/xen-tools:= )
	static? (
		app-arch/xz-utils[static-libs(+)]
		truetype? (
			app-arch/bzip2[static-libs(+)]
			media-libs/freetype[static-libs(+)]
			sys-libs/zlib[static-libs(+)]
		)
	)
	test? (
		app-admin/genromfs
		app-arch/cpio
		app-arch/lzop
		app-emulation/qemu
		dev-libs/libisoburn
		sys-apps/miscfiles
		sys-block/parted
		sys-fs/squashfs-tools
	)
	themes? (
		app-arch/unzip
		media-libs/freetype:2
	)
"
RDEPEND+="
	kernel_linux? (
		grub_platforms_efi-32? ( sys-boot/efibootmgr )
		grub_platforms_efi-64? ( sys-boot/efibootmgr )
	)
	!multislot? ( !sys-boot/grub:0 !sys-boot/grub-static )
	nls? ( sys-devel/gettext )
"

DEPEND+=" !!=media-libs/freetype-2.5.4"

RESTRICT="strip !test? ( test )"

QA_EXECSTACK="usr/bin/grub*-emu* usr/lib/grub/*"
QA_WX_LOAD="usr/lib/grub/*"
QA_MULTILIB_PATHS="usr/lib/grub/.*"

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
	fi
	default
}

src_prepare() {
	default

	sed -i -e /autoreconf/d autogen.sh || die

	if use multislot; then
		# fix texinfo file name, bug 416035
		sed -i -e 's/^\* GRUB:/* GRUB2:/' -e 's/(grub)/(grub2)/' docs/grub.texi || die
	fi

	# Nothing in Gentoo packages 'american-english' in the exact path
	# wanted for the test, but all that is needed is a compressible text
	# file, and we do have 'words' from miscfiles in the same path.
	sed -i \
		-e '/CFILESSRC.*=/s,american-english,words,' \
		tests/util/grub-fs-tester.in \
		|| die

	if [[ -n ${GRUB_AUTOGEN} ]]; then
		python_setup
		bash autogen.sh || die
		autopoint() { :; }
		eautoreconf
	fi
}

grub_do() {
	multibuild_foreach_variant run_in_build_dir "$@"
}

grub_do_once() {
	multibuild_for_best_variant run_in_build_dir "$@"
}

grub_configure() {
	local platform

	case ${MULTIBUILD_VARIANT} in
		efi*) platform=efi ;;
		xen*) platform=xen ;;
		guessed) ;;
		*) platform=${MULTIBUILD_VARIANT} ;;
	esac

	case ${MULTIBUILD_VARIANT} in
		*-32)
			if [[ ${CTARGET:-${CHOST}} == x86_64* ]]; then
				local CTARGET=i386
			fi ;;
		*-64)
			if [[ ${CTARGET:-${CHOST}} == i?86* ]]; then
				local CTARGET=x86_64
				local -x TARGET_CFLAGS="-Os -march=x86-64 ${TARGET_CFLAGS}"
				local -x TARGET_CPPFLAGS="-march=x86-64 ${TARGET_CPPFLAGS}"
			fi ;;
	esac

	local myeconfargs=(
		--disable-werror
		--program-prefix=
		--libdir="${EPREFIX}"/usr/lib
		--htmldir="${EPREFIX}"/usr/share/doc/${PF}/html
		$(use_enable debug mm-debug)
		$(use_enable device-mapper)
		$(use_enable mount grub-mount)
		$(use_enable nls)
		$(use_enable themes grub-themes)
		$(use_enable truetype grub-mkfont)
		$(use_enable libzfs)
		$(use sdl && use_enable debug grub-emu-sdl)
		${platform:+--with-platform=}${platform}

		# Let configure detect this where supported
		$(usex efiemu '' '--disable-efiemu')
	)

	if use multislot; then
		myeconfargs+=( --program-transform-name="s,grub,grub2," )
	fi

	# Set up font symlinks
	ln -s "${WORKDIR}/${UNIFONT}.pcf" unifont.pcf || die
	if use themes; then
		ln -s "${WORKDIR}/${DEJAVU}/ttf/DejaVuSans.ttf" DejaVuSans.ttf || die
	fi

	local ECONF_SOURCE="${S}"
	econf "${myeconfargs[@]}"
}

src_configure() {
	# Bug 508758.
	replace-flags -O3 -O2

	# We don't want to leak flags onto boot code.
	export HOST_CCASFLAGS=${CCASFLAGS}
	export HOST_CFLAGS=${CFLAGS}
	export HOST_CPPFLAGS=${CPPFLAGS}
	export HOST_LDFLAGS=${LDFLAGS}
	unset CCASFLAGS CFLAGS CPPFLAGS LDFLAGS

	use static && HOST_LDFLAGS+=" -static"

	tc-ld-disable-gold #439082 #466536 #526348
	export TARGET_LDFLAGS="${TARGET_LDFLAGS} ${LDFLAGS}"
	unset LDFLAGS

	tc-export CC NM OBJCOPY RANLIB STRIP
	tc-export BUILD_CC # Bug 485592

	MULTIBUILD_VARIANTS=()
	local p
	for p in "${GRUB_ALL_PLATFORMS[@]}"; do
		use "grub_platforms_${p}" && MULTIBUILD_VARIANTS+=( "${p}" )
	done
	[[ ${#MULTIBUILD_VARIANTS[@]} -eq 0 ]] && MULTIBUILD_VARIANTS=( guessed )
	grub_do grub_configure
}

src_compile() {
	# Sandbox bug 404013.
	use libzfs && addpredict /etc/dfs:/dev/zfs

	grub_do emake
	use doc && grub_do_once emake -C docs html
}

src_test() {
	# The qemu dependency is a bit complex.
	# You will need to adjust QEMU_SOFTMMU_TARGETS to match the cpu/platform.
	grub_do emake check
}

src_install() {
	grub_do emake install DESTDIR="${D}" bashcompletiondir="$(get_bashcompdir)"
	use doc && grub_do_once emake -C docs install-html DESTDIR="${D}"

	einstalldocs

	if use multislot; then
		mv "${ED%/}"/usr/share/info/grub{,2}.info || die
	fi

	insinto /etc/default
	newins "${FILESDIR}"/grub.default-3 grub
}

pkg_postinst() {
	elog "For information on how to configure GRUB2 please refer to the guide:"
	elog "    https://wiki.gentoo.org/wiki/GRUB2_Quick_Start"

	if has_version 'sys-boot/grub:0'; then
		elog "A migration guide for GRUB Legacy users is available:"
		elog "    https://wiki.gentoo.org/wiki/GRUB2_Migration"
	fi

	if [[ -z ${REPLACING_VERSIONS} ]]; then
		elog
		elog "You may consider installing the following optional packages:"
		optfeature "Detect other operating systems (grub-mkconfig)" sys-boot/os-prober
		optfeature "Create rescue media (grub-mkrescue)" dev-libs/libisoburn
		optfeature "Enable RAID device detection" sys-fs/mdadm
	fi
}
