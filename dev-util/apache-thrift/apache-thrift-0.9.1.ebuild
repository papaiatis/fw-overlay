# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
PYTHON_DEPEND="python? 2"
inherit python eutils

DESCRIPTION="Thrift is an interface definition language that is used to define
and create services for numerous languages."
HOMEPAGE="https://thrift.apache.org"
SRC_URI="https://github.com/apache/thrift/archive/${PV}.tar.gz -> thrift-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+pic gnu-ld +cpp +boost +libevent +zlib qt4 +c_glib csharp +java erlang +python
perl php php_extension ruby haskell go d"

DEPEND="
    virtual/yacc
    dev-libs/openssl
    cpp? (
        boost? ( >=dev-libs/boost-1.40.0 )
        zlib? ( >=sys-libs/zlib-1.2.3 )
        libevent? ( dev-libs/libevent )
    )
    java? (
        >=virtual/jdk-1.5
        >=dev-java/ant-1.7
        dev-java/ant-ivy
        dev-java/commons-lang
        dev-java/slf4j-api
    )
    csharp? ( >=dev-lang/mono-1.2.4 )
    erlang? ( >=dev-lang/erlang-12.0.0 )
    python? ( >=dev-lang/python-2 <dev-lang/python-3 )
    perl? (
        dev-lang/perl
        dev-perl/Bit-Vector
        dev-perl/Class-Accessor
    )
    php? ( >=dev-lang/php-5.0.0 )
    php_extension? ( >=dev-lang/php-5.0.0 )
    haskell? ( dev-haskell/haskell-platform )
    ruby? ( dev-lang/ruby )
    go? ( dev-lang/go )
    "
RDEPEND="${DEPEND}"

S="${WORKDIR}/thrift-${PV}"

src_prepare() {
    cd "${S}"
    epatch "${FILESDIR}/thrift-0.9-mvn-path-fix.patch"
}

pkg_setup() {
    python_set_active_version 2
    python_pkg_setup
}

src_configure() {
    ./bootstrap.sh
    econf \
        $(use_with pic) \
        $(use_with gnu-ld) \
        $(use_with cpp) \
        $(use_with boost) \
        $(use_with libevent) \
        $(use_with zlib) \
        $(use_with qt4) \
        $(use_with c_glib) \
        $(use_with csharp) \
        $(use_with java) \
        $(use_with erlang) \
        $(use_with python) \
        $(use_with perl) \
        $(use_with php) \
        $(use_with php_extension) \
        $(use_with ruby) \
        $(use_with haskell) \
        $(use_with go) \
        $(use_with d)
}
