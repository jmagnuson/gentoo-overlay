# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop qmake-utils

DESCRIPTION="Configuration utility for RGB lights supporting motherboards, RAM, & peripherals"
HOMEPAGE="https://gitlab.com/CalcProgrammer1/OpenRGB"
SRC_URI="https://gitlab.com/CalcProgrammer1/OpenRGB/uploads/c59231aa792166779b2b41fe3033766c/OpenRGB-release_${PV}.tar.gz"
S="${WORKDIR}/OpenRGB-release_${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	virtual/libusb
"

src_configure() {
	eqmake5
}

src_install() {
	dobin OpenRGB
	doicon qt/OpenRGB.png
	make_desktop_entry OpenRGB OpenRGB OpenRGB
}

pkg_postinst() {
	elog "To control colors, the user needs to be able to access the device, so probably should be added to the 'usb' group."
}
