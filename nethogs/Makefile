include $(TOPDIR)/rules.mk

PKG_NAME:=nethogs
PKG_VERSION:=0.8.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/raboof/nethogs/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=957d6afcc220dfbba44c819162f44818051c5b4fb793c47ba98294393986617d

PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILE:=COPYING
PKG_MAINTAINER:=sbwml <admin@cooluc.com>

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Net top tool grouping bandwidth per process
  URL:=https://github.com/raboof/nethogs
  DEPENDS:=+libncurses +libpcap +libstdcpp
endef

define Package/mentohust/description
  NetHogs is a small 'net top' tool. Instead of breaking the traffic down per
  protocol or per subnet, like most tools do, it groups bandwidth by process.
  NetHogs does not rely on a special kernel module to be loaded.
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/local/sbin/nethogs $(1)/usr/sbin/nethogs
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
