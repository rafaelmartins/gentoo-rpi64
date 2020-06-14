# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Raspberry Pi 3/4 bluetooth helpers"
HOMEPAGE="https://github.com/RPi-Distro/pi-bluetooth/"
LICENSE="BSD"
SLOT="0"

SRC_URI="http://archive.raspberrypi.org/debian/pool/main/${PN:0:1}/${PN}/${PN}_${PV}.tar.xz"
KEYWORDS="~arm64"
IUSE=""
RDEPEND="
	net-wireless/bluez[deprecated]
	sys-apps/raspberrypi-sys-mods
	sys-firmware/bluez-firmware-bcm434xx
"

S="${WORKDIR}/${PN}"

src_prepare() {
	default
	sed -i \
		-e 's,^/bin/hciconfig,/usr/bin/hciconfig,' \
		usr/bin/bthelper || die
}

src_install() {
	dobin usr/bin/bthelper

	newinitd "${FILESDIR}/pi-bluetooth.initd" pi-bluetooth
}
