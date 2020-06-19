# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mount-boot vcs-snapshot

DESCRIPTION="Pre-built Linux kernel for Raspberry Pi"
HOMEPAGE="https://github.com/raspberrypi/firmware"
LICENSE="GPL-2"
SLOT="0"
RESTRICT="strip"

GIT_SHA=9d4f640
MY_P="raspberrypi-firmware-${GIT_SHA}"

SRC_URI="https://github.com/raspberrypi/firmware/archive/${GIT_SHA}.tar.gz -> ${MY_P}.tar.gz"
KEYWORDS="-* ~arm64"
IUSE=""

S="${WORKDIR}/${MY_P}"

src_install() {
	insinto /lib/modules
	doins -r modules/*-v8+

	insinto /boot
	doins boot/kernel8.img boot/bcm2710*.dtb boot/bcm2711*.dtb
	doins -r boot/overlays
}
