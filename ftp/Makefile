#
# Copyright (C) 2007-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ftp
PKG_VERSION:=0.17
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/netkit-ftp-$(PKG_VERSION)

PKG_SOURCE:=netkit-ftp_$(PKG_VERSION).orig.tar.gz
PKG_SOURCE_URL:= \
	https://ftp.debian.org/debian/pool/main/n/netkit-ftp/ \
	https://mirrors.pku.edu.cn/debian/pool/main/n/netkit-ftp/ \
	https://mirror.sjtu.edu.cn/debian/pool/main/n/netkit-ftp/
PKG_HASH:=61c913299b81a4671ff089aac821329f7db9bc111aa812993dd585798b700349

PKG_LICENSE:=BSD
PKG_MAINTAINER:=sbwml <admin@cooluc.com>

include $(INCLUDE_DIR)/package.mk

define Package/ftp
  SUBMENU:=File Transfer
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Classic file transfer client
endef

define Package/ftp/description
  The ftp package provides the standard UNIX command-line FTP (File
  Transfer Protocol) client.  FTP is a widely used protocol for
  transferring files over the Internet and for archiving files.
endef

CONFIGURE_ARGS:=--without-readline --enable-ipv6

define Package/ftp/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ftp/ftp $(1)/usr/bin/ftp
	$(LN) -sf ftp $(1)/usr/bin/pftp
endef

$(eval $(call BuildPackage,ftp))
