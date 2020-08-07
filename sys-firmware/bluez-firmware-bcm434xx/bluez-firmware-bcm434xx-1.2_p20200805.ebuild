# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

DESCRIPTION="Binary firmware for Raspberry Pi 3/4 BlueTooth adapters"
HOMEPAGE="http://www.bluez.org"
LICENSE="bluez-firmware"
SLOT="0"

GIT_SHA=afe608e
MY_P="${PN}-${GIT_SHA}"

SRC_URI="https://github.com/RPi-Distro/bluez-firmware/archive/${GIT_SHA}.tar.gz -> ${MY_P}.tar.gz"
KEYWORDS="~arm ~arm64"
IUSE=""

S="${WORKDIR}/${MY_P}"

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	insinto /lib/firmware/brcm
	doins broadcom/*.hcd
}
