# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit udev unpacker

DESCRIPTION="Miscellaneous Raspberry Pi utilities and libraries"
HOMEPAGE="https://github.com/raspberrypi/userland/"
LICENSE="BSD"
SLOT="0"
RESTRICT="strip"

MY_PN="${PN%%-bin}"
MY_PV="2+git20200813~095940+f73fca0-1"  # version is fully hardcoded, there's no version 2 in git

SRC_URI="
	http://archive.raspberrypi.org/debian/pool/main/${MY_PN:0:1}/${MY_PN}/libraspberrypi0_${MY_PV}_arm64.deb
	http://archive.raspberrypi.org/debian/pool/main/${MY_PN:0:1}/${MY_PN}/libraspberrypi-bin_${MY_PV}_arm64.deb
	http://archive.raspberrypi.org/debian/pool/main/${MY_PN:0:1}/${MY_PN}/libraspberrypi-dev_${MY_PV}_arm64.deb
"

KEYWORDS="-* ~arm64"
IUSE=""
RDEPEND="
	sys-apps/dtc
	sys-boot/raspberrypi-bootloader
	virtual/udev
"

S="${WORKDIR}"

src_install() {
	insinto /lib
	doins -r lib/udev

	insinto /usr
	doins -r usr/include

	insopts -m 0755
	mv usr/lib/aarch64-linux-gnu usr/lib64 || die
	doins -r usr/bin usr/lib64
}

pkg_postinst() {
	udev_reload
}
