# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{7,8}} )

inherit python-any-r1 vcs-snapshot

DESCRIPTION="Raspberry Pi 4 boot EEPROM updater"
HOMEPAGE="https://github.com/raspberrypi/rpi-eeprom/"
LICENSE="BSD raspberrypi-only"
SLOT="0"

GIT_SHA=4731bda
MY_P="${PN}-${GIT_SHA}"

SRC_URI="https://github.com/raspberrypi/${PN}/archive/${GIT_SHA}.tar.gz -> ${MY_P}.tar.gz"
KEYWORDS="~arm64"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	sys-apps/pciutils
	sys-boot/raspberrypi-bootloader
	media-libs/raspberrypi-userland-bin"

S="${WORKDIR}/${MY_P}"

src_install() {
	dobin \
		rpi-eeprom-config \
		rpi-eeprom-update

	insinto /lib/firmware/raspberrypi/bootloader
	doins -r \
		firmware/critical \
		firmware/stable \
		firmware/beta \
		firmware/release-notes.md

	mkdir -p "${ED}/etc/default" || die
	echo 'FIRMWARE_RELEASE_STATUS="beta"' > "${ED}/etc/default/rpi-eeprom-update" || die

	keepdir /var/lib/raspberrypi/bootloader/backup

	# TODO: openrc service, generate man pages
}
