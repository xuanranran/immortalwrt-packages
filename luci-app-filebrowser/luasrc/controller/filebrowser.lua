-- Copyright 2018-2020 Lienol <lawlienol@gmail.com>
-- Improve by xiaozhuai <xiaozhuai7@gmail.com>
module("luci.controller.filebrowser", package.seeall)

local http = require "luci.http"

function index()
	if not nixio.fs.access("/etc/config/filebrowser") then
		return
	end

	local page = entry({"admin", "services", "filebrowser"}, alias("admin", "services", "filebrowser", "settings"), _("File Browser"), 100)
	page.dependent = true
	page.acl_depends = { "luci-app-filebrowser" }

	entry({"admin", "services", "filebrowser", "settings"}, cbi("filebrowser/settings"), _("Settings"), 1).leaf = true
	entry({"admin", "services", "filebrowser", "log"}, cbi("filebrowser/log"), _("Log"), 2).leaf = true
	entry({"admin", "services", "filebrowser", "check"}, call("action_check")).leaf = true
	entry({"admin", "services", "filebrowser", "status"}, call("act_status")).leaf = true
	entry({"admin", "services", "filebrowser", "get_log"}, call("get_log")).leaf = true
	entry({"admin", "services", "filebrowser", "clear_log"}, call("clear_log")).leaf = true
end

function http_write_json(content)
	http.prepare_content("application/json")
	http.write_json(content or {code = 1})
end

function act_status()
	local e = {}
	e.running = luci.sys.call("pgrep filebrowser >/dev/null") == 0
	http_write_json(e)
end

function get_log()
	luci.http.write(luci.sys.exec("[ -f '/var/log/filebrowser.log' ] && cat /var/log/filebrowser.log"))
end

function clear_log()
	luci.sys.call("echo '' > /var/log/filebrowser.log")
end
