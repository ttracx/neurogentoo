# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs multilib

DESCRIPTION="Scores crystallographic Laue and space groups"
HOMEPAGE="ftp://ftp.mrc-lmb.cam.ac.uk/pub/pre/pointless.html"
SRC_URI="ftp://ftp.mrc-lmb.cam.ac.uk/pub/pre/${P}.tar.gz"

SLOT="0"
LICENSE="ccp4"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sci-chemistry/ccp4
	>=sci-libs/ccp4-libs-6.1.1-r5
	sci-libs/cctbx"
DEPEND="${RDEPEND}"

S=${WORKDIR}

src_compile() {
	# Fails to link against my libcctbx
	# Tried stealing autotools from ccp4 but that breaks differently with a weird boost error.
	emake  \
		-f Makefile.make \
		CC=$(tc-getCC) \
		CXX=$(tc-getCXX) \
		CFLAGS="${CFLAGS}" \
		CXXFLAGS="${CXXFLAGS}" \
		LFLAGS="${LDFLAGS}" \
		CLIB="/usr/$(get_libdir)" \
		CCTBX_sources=/usr/$(get_libdir)/cctbx/cctbx_sources \
		CCTBX_VERSION=2009 \
		ICCP4=-I/usr/include/ccp4 \
		ICLPR="-I/usr/include -I/usr/$(get_libdir)/cctbx/cctbx_sources -I/usr/$(get_libdir)/cctbx/cctbx_build/include" \
		LTBX="-L/usr/$(get_libdir)/cctbx/cctbx_build/lib -lcctbx" \
		|| die
#		LCCP4=" $(gcc-config -L | awk -F: '{for(i=1; i<=NF; i++) printf " -L%s", $i}') -L/usr/$(get_libdir) -lgfortran -lgfortranbegin -lccp4c -lccp4f -lm" \
#		LCCP4="-L/usr/$(get_libdir) -lccp4c -lccp4f -lm" \
}

src_install() {
	dobin pointless othercell || die
}
