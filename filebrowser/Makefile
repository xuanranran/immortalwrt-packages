#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_ARCH_filebrowser:=$(ARCH)

PKG_NAME:=filebrowser
PKG_VERSION:=2.31.2
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_CONFIG_DEPENDS:=CONFIG_FILEBROWSER_COMPRESS_UPX

ifeq ($(ARCH),x86_64)
	PKG_ARCH:=amd64
endif

ifeq ($(ARCH),aarch64)
	PKG_ARCH:=arm64
endif

ifeq ($(ARCH),arm)
	PKG_ARCH:=armv7
endif

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Web Servers/Proxies
	TITLE:=filebrowser
	DEPENDS:=@(arm||aarch64||x86_64)
	URL:=https://filebrowser.org/
endef

define Package/$(PKG_NAME)/description
  File Browser is a create-your-own-cloud-kind of software where you can install it on a server
endef

define Package/$(PKG_NAME)/config
config FILEBROWSER_COMPRESS_UPX
	bool "Compress executable files with UPX"
	default n
endef

define Download/$(PKG_NAME)
  URL:=https://github.com/filebrowser/filebrowser/releases/download/v$(PKG_VERSION)
  URL_FILE:=linux-$(PKG_ARCH)-filebrowser.tar.gz
  FILE:=filebrowser-$(PKG_VERSION)-$(PKG_ARCH)_static.tar.gz
  HASH:=skip
endef

define Build/Configure
endef

define Build/Compile
	( \
		pushd $(PKG_BUILD_DIR) ; \
			tar zxvf $(DL_DIR)/filebrowser-$(PKG_VERSION)-$(PKG_ARCH)_static.tar.gz -C . ; \
		popd ; \
	)
ifneq ($(CONFIG_FILEBROWSER_COMPRESS_UPX),)
	$(STAGING_DIR_HOST)/bin/upx --lzma --best $(PKG_BUILD_DIR)/filebrowser
endif
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/filebrowser $(1)/usr/sbin/filebrowser
endef

$(eval $(call Download,$(PKG_NAME)))
$(eval $(call BuildPackage,$(PKG_NAME)))
