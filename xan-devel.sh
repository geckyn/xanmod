#!/bin/bash



mv -f ../linux-headers*.deb ../linux-headers*.deb.bak
mv -f ../linux-image*.deb ../linux-image*.deb.bak



make clean && make mrproper



make devel_defconfig


time KBUILD_BUILD_TIMESTAMP='' make CC="ccache gcc" -j4 deb-pkg LOCALVERSION=-devel



sudo dpkg -i ../linux-headers*.deb ../linux-image*.deb
