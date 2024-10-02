local sys = require "luci.sys"

a = Map("tailscale")
a.title = translate("Tailscale")
a.description = translate("Tailscale connects your team's devices and development environments for easy access to remote resources.")

a:section(SimpleSection).template  = "tailscale/tailscale_status"

t = a:section(NamedSection, "sample_config", "tailscale")
t.anonymous = true
t.addremove = false

e = t:option(Flag, "enabled", translate("Enable"))
e.default = 0
e.rmempty = false

e = t:option(Value, "subnet_routes", translate("Subnet Routes"))
e.placeholder = "192.168.31.0/24"
e.rmempty = true

e = t:option(DummyValue, "opennewwindow", translate("<input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"tailscale.com\" onclick=\"window.open('https://login.tailscale.com/admin/machines')\" />"))
e.description = translate("Create or manage your tailscale network")

e = t:option(DummyValue, "_authinfo", translate("Log"))

function e.cfgvalue(self, section)
    local logfile = "/tmp/tailscale.log"
    local content = nixio.fs.readfile(logfile)
    return content or ""
  end

return a