#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.10.1.1/g' package/base-files/files/bin/config_generate

# Modify default Hostname
sed -i "s/hostname='OpenWrt'/hostname='CXT-OpenWrt'/g" package/base-files/files/bin/config_generate

# Modify default Timezone
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# Enable NTP Server
sed -i "s/system.ntp.enable_server='0'/system.ntp.enable_server='1'/g" package/base-files/files/bin/config_generate

# Modify default password(cxthhhhh.com)
sed -i '1d' package/base-files/files/etc/shadow
sed -i '1i\root:$1$UIl1uSg0$tAW9qjOqoCto0CIUgUwHT1:0:0:99999:7:::' package/base-files/files/etc/shadow

# Modify default Themes to Argon
sed -i 's/config internal themes/config internal themes\n    option Argon  \"\/luci-static\/argon\"/g' feeds/luci/modules/luci-base/root/etc/config/luci
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# Modify default WIFI SSID 
sed -i 's/OpenWrt/CXT-OpenWRT/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

