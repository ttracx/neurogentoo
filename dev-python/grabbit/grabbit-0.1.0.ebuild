# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )
PYTHON_REQ_USE="threads(+),sqlite"

inherit distutils-r1

DESCRIPTION="Get grabby with file trees"
HOMEPAGE="https://github.com/grabbles/grabbit"
SRC_URI="https://github.com/grabbles/grabbit/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
#	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
RDEPEND=""

# Tests are broken https://github.com/grabbles/grabbit/issues/53
#python_test() {
#	py.test -v || die
#}
