# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="udev rules to fixup some USB Sata adapters"
HOMEPAGE="https://github.com/rafaelmartins/gentoo-rpi64"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm ~arm64"
IUSE=""

RDEPEND="virtual/udev"

S="${WORKDIR}"

src_install() {
	insinto /lib/udev/rules.d
	doins "${FILESDIR}/10-sata-to-usb.rules"
}
