include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-adguardhome
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-adguardhome
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI app for adguardhome
	PKGARCH:=all
	DEPENDS:=+!wget-ssl&&!curl:wget-ssl
endef

define Package/luci-app-adguardhome/description
  LuCI support for adguardhome
endef

define Package/luci-app-adguardhome/conffiles
/usr/share/AdGuardHome/links.txt
/etc/config/AdGuardHome
/etc/adguardhome
endef

define Package/luci-app-adguardhome/prerm
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
     /etc/init.d/AdGuardHome disable
     /etc/init.d/AdGuardHome stop
uci -q batch <<-EOF >/dev/null 2>&1
	delete ucitrack.@AdGuardHome[-1]
	commit ucitrack
EOF
fi
exit 0
endef

$(eval $(call BuildPackage,luci-app-adguardhome))

# call BuildPackage - OpenWrt buildroot signature
