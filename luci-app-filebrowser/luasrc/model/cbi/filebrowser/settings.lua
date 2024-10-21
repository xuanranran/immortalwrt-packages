m = Map("filebrowser")
m.title = translate("File Browser")
m.description = translate("File explorer is software that creates your own cloud that you can install on a server, point it to a path, and then access your files through a beautiful web interface. You have many features available!")

m:section(SimpleSection).template = "filebrowser/filebrowser_status"

s = m:section(TypedSection, "global")
s.anonymous = true
s.addremove = false

o = s:option(Flag, "enable", translate("Enable"))
o.rmempty = false

o = s:option(Value, "address", translate("Listen address"))
o.default = "0.0.0.0"
o.rmempty = false

o = s:option(Value, "port", translate("Listen port"))
o.datatype = "port"
o.default = 8088
o.rmempty = false

o = s:option(Value, "database", translate("Database path"))
o.default = "/etc/filebrowser.db"
o.rmempty = false

o = s:option(Value, "username", translate("Initial username"))
o.default = "admin"
o.rmempty = false

o = s:option(Value, "password", translate("Initial password"))
o.default = "admin"
o.rmempty = false
o.password = true

o = s:option(Value, "ssl_cert", translate("SSL cert"))
o.default = ""

o = s:option(Value, "ssl_key", translate("SSL key"))
o.default = ""

o = s:option(Value, "root_path", translate("Root path"))
o.description = translate("Point to a path to access your files in the web interface, default is /")
o.default = "/"
o.rmempty = false

return m
