# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Ab initio ncRNA prediction"
HOMEPAGE="http://bioinformatics.cenargen.embrapa.br/portrait"
SRC_URI="http://bioinformatics.cenargen.embrapa.br/portrait/download/portrait.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="
	${DEPEND}
	dev-lang/perl
	sci-biology/ANGLE-bin
	sci-biology/cast-bin
	sci-libs/libsvm"
# was only tested with sci-libs/libsvm-2.84

src_install(){
	dobin *.pl
	dodoc README.txt
	insinto /usr/share/"${PN}"
	doins *.model
}
