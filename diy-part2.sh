#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
rm -rf /package/luci-theme-argon
sudo git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git /package/lean/luci-theme-argon
sudo git clone https://github.com/jerrykuku/lua-maxminddb.git /package/lean/lua-maxminddb
sudo git clone https://github.com/jerrykuku/luci-app-vssr.git /package/lean/luci-app-vssr
sudo git clone https://github.com/vernesong/OpenClash.git /package/lean/luci-app-openclash

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.184/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i 's/OpenWrt/Pi/g' package/base-files/files/bin/config_generate

# Modify the version number
sed -i "s/OpenWrt /PenV build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="PenV"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"PenV"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config
    
