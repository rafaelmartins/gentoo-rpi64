# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="System tweaks for the Raspberry Pi"
HOMEPAGE="https://github.com/RPi-Distro/raspberrypi-sys-mods"
LICENSE="BSD"
SLOT="0"
RDEPEND="
	acct-group/gpio
	acct-group/i2c
	acct-group/spi
	sys-devel/gettext
	sys-libs/libcap
"

SRC_URI="http://archive.raspberrypi.org/debian/pool/main/${PN:0:1}/${PN}/${PN}_${PV/0_p/}.tar.xz"
KEYWORDS="~arm ~arm64"
IUSE=""

S="${WORKDIR}/${PN}"

src_prepare() {
	default

	mv etc.armhf/udev/rules.d/99-com.rules lib/udev/rules.d/ || die
	rm -rf etc.armhf/udev
	rm lib/udev/rules.d/80-noobs.rules
}

src_install() {
	insinto /
	doins -r lib

	insinto /etc
	doins -r etc.armhf/*

	exeinto /usr/lib/raspberrypi-sys-mods
	doexe usr/lib/raspberrypi-sys-mods/*
}
