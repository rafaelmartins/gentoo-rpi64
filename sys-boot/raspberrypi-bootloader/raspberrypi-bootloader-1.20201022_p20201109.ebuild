# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mount-boot vcs-snapshot

DESCRIPTION="Raspberry Pi bootloader blobs"
HOMEPAGE="https://github.com/raspberrypi/firmware"
LICENSE="raspberrypi-only"
SLOT="0"
RESTRICT="strip"

GIT_SHA=94c59c4
MY_P="raspberrypi-firmware-${GIT_SHA}"

SRC_URI="https://github.com/raspberrypi/firmware/archive/${GIT_SHA}.tar.gz -> ${MY_P}.tar.gz"
KEYWORDS="-* ~arm64"
IUSE=""

S="${WORKDIR}/${MY_P}"

src_install() {
	insinto /boot
	doins boot/bootcode.bin boot/fixup* boot/start*
	newins "${FILESDIR}/config-1.txt" config.txt
	newins "${FILESDIR}/cmdline-1.txt" cmdline.txt

	dodir /etc/env.d
	echo 'CONFIG_PROTECT="/boot/config.txt /boot/cmdline.txt"' > "${ED}"/etc/env.d/00bootloader
}

pkg_postinst() {
	elog "Make sure to edit /boot/config.txt and /boot/cmdline.txt to suit your needs!"
}
