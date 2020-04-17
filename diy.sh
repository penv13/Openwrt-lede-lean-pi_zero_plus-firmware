#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
rm -rf /package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git /package/luci-theme-argon
git clone https://github.com/jerrykuku/lua-maxminddb.git /package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git /package/luci-app-vssr
git clone https://github.com/vernesong/OpenClash.git /package/OpenClash

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.184/g' package/base-files/files/bin/config_generate
