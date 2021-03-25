#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

echo "Start CXT Setting the firmware 1"
echo "Start CXT Setting the firmware 1"

# Install Environment
sudo apt -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync mkisofs

# Update Themes to Argon and Modify Color
cd package/lean
rm -rf luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
sed -i "s/--primary: #5e72e4/--primary: #ff26d6d1/g" luci-theme-argon/htdocs/luci-static/argon/css/cascade.css
sed -i "s/--primary: #5e72e4/--primary: #ff26d6d1/g" luci-theme-argon/htdocs/luci-static/argon/less/cascade.less

# Add Themes WebUI Background
wget -O 'cxt-background.zip' https://github.com/MeowLove/OpenWRT-Virtualization-Servers/raw/master/background/background.zip
unzip cxt-background.zip -d luci-theme-argon/htdocs/luci-static/argon/
cp luci-theme-argon/htdocs/luci-static/argon/background/bg1.jpg luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
rm -rf cxt-background.zip
cd ..
cd ..

echo "End CXT Setting the firmware 1"
echo "End CXT Setting the firmware 1"