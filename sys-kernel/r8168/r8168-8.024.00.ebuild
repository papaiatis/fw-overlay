inherit linux-mod

DESCRIPTION="Realtek RTL8111B/RTL8168B NIC drivers"
HOMEPAGE="http://www.realtek.com.tw/downloads/downloadsView.aspx?Langid=1&PNid=13&PFid=5&Level=5&Conn=4&DownTypeID=3&GetDown=false#2"
SRC_URI="${P}.tar.bz2"
RESTRICT="fetch"
LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

MODULE_NAMES="src/r8168(kernel/drivers/net:${S}:${S})"
BUILD_TARGETS="modules"