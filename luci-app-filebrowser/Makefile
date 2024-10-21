# Copyright (C) 2018-2020 Lienol <lawlienol@gmail.com>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#
# Improve by xiaozhuai <xiaozhuai7@gmail.com>
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-filebrowser
PKG_VERSION:=1.1
PKG_RELEASE:=2

LUCI_TITLE:=LuCI support for FileBrowser
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+filebrowser +luci-compat

define Package/$(PKG_NAME)/conffiles
/etc/filebrowser.db
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
