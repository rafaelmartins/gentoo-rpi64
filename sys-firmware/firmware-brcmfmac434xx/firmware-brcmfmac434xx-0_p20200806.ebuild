# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

DESCRIPTION="Binary firmware for Raspberry Pi 802.11 wireless cards (BCM434XX)"
HOMEPAGE="http://archive.raspberrypi.org/debian/pool/main/f/firmware-nonfree/"
LICENSE="GPL-2+ Broadcom Cypress"  # GPL-2+ from SPDX comments, others from linux-firmware/WHENCE and deb
SLOT="0"
RDEPEND="!sys-kernel/linux-firmware[-savedconfig]"

LF_SHA=887d2a1
MY_P="firmware-brcm80211_20190114-1+rpt7"
SRC_URI="
	http://archive.raspberrypi.org/debian/pool/main/f/firmware-nonfree/${MY_P}_all.deb
	https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt?id=${LF_SHA}
		-> brcmfmac43430-sdio.raspberrypi,3-model-b-${LF_SHA}.txt
	https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt?id=${LF_SHA}
		-> brcmfmac43455-sdio.raspberrypi,3-model-b-plus-${LF_SHA}.txt
	https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt?id=${LF_SHA}
		-> brcmfmac43455-sdio.raspberrypi,4-model-b-${LF_SHA}.txt
"
KEYWORDS="~arm ~arm64"
IUSE=""

S="${WORKDIR}"

src_install() {
	insinto /lib/firmware/brcm
	doins \
		lib/firmware/brcm/brcmfmac43430-sdio.bin \
		lib/firmware/brcm/brcmfmac43455-sdio.bin \
		lib/firmware/brcm/brcmfmac43455-sdio.clm_blob
	newins \
		"${DISTDIR}/brcmfmac43430-sdio.raspberrypi,3-model-b-${LF_SHA}.txt" \
		brcmfmac43430-sdio.raspberrypi,3-model-b.txt
	newins \
		"${DISTDIR}/brcmfmac43455-sdio.raspberrypi,3-model-b-plus-${LF_SHA}.txt" \
		brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
	newins \
		"${DISTDIR}/brcmfmac43455-sdio.raspberrypi,4-model-b-${LF_SHA}.txt" \
		brcmfmac43455-sdio.raspberrypi,4-model-b.txt
}
