include $(TOPDIR)/rules.mk

PKG_NAME:=nat6
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=sbwml <admin@cooluc.com>

include $(INCLUDE_DIR)/package.mk

define Package/nat6
  SECTION:=net
  CATEGORY:=Network
  TITLE:=IPv6 NAT
  DEPENDS:=+kmod-nft-nat +nftables-json
endef

define Build/Compile
endef

define Package/nat6/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/60-luci-firewall-nat6 $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/nat6.init $(1)/etc/init.d/nat6
	$(INSTALL_DIR) $(1)/usr/share/ucitrack
	$(INSTALL_CONF) ./files/nat6.ucitrack $(1)/usr/share/ucitrack/nat6.json
endef

$(eval $(call BuildPackage,nat6))
