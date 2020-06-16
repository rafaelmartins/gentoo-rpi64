# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Dump the state of Raspberry Pi GPIOs"
HOMEPAGE="https://github.com/RPi-Distro/raspi-gpio/"
LICENSE="BSD"
SLOT="0"

SRC_URI="http://archive.raspberrypi.org/debian/pool/main/${PN:0:1}/${PN}/${PN}_${PV}.tar.xz"
KEYWORDS="~arm ~arm64"
IUSE=""

S="${WORKDIR}/${PN}"
