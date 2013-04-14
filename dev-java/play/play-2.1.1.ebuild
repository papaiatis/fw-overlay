# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils versionator

DESCRIPTION="The High Velocity Web Framework For Java and Scala"
HOMEPAGE="http://www.playframework.com/"

SRC_URI="http://downloads.typesafe.com/play/${PV}/play-${PV}.zip"

LICENSE="Apache-2.0"
KEYWORDS="amd64 ppc ppc64 x86 ~x86-fbsd ~amd64-linux ~x86-linux ~x86-macos"
SLOT="$(get_major_version)"
IUSE=""
RESTRICT="mirror"

DEPEND=">=virtual/jdk-1.6
       "

RDEPEND=">=virtual/jre-1.6
        "

pkg_setup() {
    enewgroup playdevelopers
}

src_install() {
        local dir="/opt/${P}"
        insinto "${dir}"
        doins -r *

        local repodir="${dir}/repository"
        local bootdir="${dir}/framework/sbt/boot"
        local skeldir="${dir}/framework/skeletons"

        fperms 0755 "${dir}/${PN}"
        fperms 0775 "${repodir}"
        fowners root:playdevelopers "${repodir}"

        keepdir "${bootdir}"
        fowners root:playdevelopers "${bootdir}"
        fperms 0775 "${bootdir}"

        chown -R root:playdevelopers "${ED}/${dir}/framework/skeletons"

        find "${ED}/${dir}/framework/skeletons" -type d -print0 | xargs -0 chmod -R 775

        make_wrapper "${P}" "${dir}/${PN}"
        elog "You must be in the playdevelopers group to use Play2 framework."
}
