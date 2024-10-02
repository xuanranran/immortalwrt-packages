module("luci.controller.tailscale", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/tailscale") then
		return
	end

entry({"admin","vpn"}, firstchild(), "VPN", 45).dependent = false
entry({"admin", "vpn", "tailscale"}, alias("admin", "vpn", "tailscale", "base"), _("Tailscale"), 99)
entry({"admin", "vpn", "tailscale", "base"}, cbi("tailscale/base"), _("Base Setting"), 1)
entry({"admin", "vpn", "tailscale", "status"}, call("act_status"))
end

function act_status()
local e={}
  e.running=luci.sys.call("pgrep /usr/bin/tailscaled >/dev/null")==0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
