--hello
print('init.lua ver 1.2')
wifi.setmode(wifi.STATIONAP)
print('set mode=STATION (mode='..wifi.getmode()..')')
print('MAC: ',wifi.sta.getmac())
print('chip: ',node.chipid())
print('heap: ',node.heap())
-- wifi config start
--wifi.sta.config("SSID","MasterPassword")

-- Connecti to a Wi-Fi network
wifi.sta.config{ssid='CCGuest', pwd='1+passion!'}
wifi.sta.connect()
wifi.ap.config{ssid='Följ min instagram: @iammanne',pwd='farmen12345'}
do
local sta_config=wifi.sta.getconfig(true)
print(string.format("\tCurrent station config\n\tssid:\"%s\"\tpassword:\"%s\"\n\tbssid:\"%s\"\tbssid_set:%s", sta_config.ssid, sta_config.pwd, sta_config.bssid, (sta_config.bssid_set and "true" or "false")))
end
--
-- local ws = websocket.createClient()
-- ws:config({headers={['User-Agent']='NodeMCU'}})
-- ws:connect('ws://echo.websocket.org')
--
-- ws:on("connection", function(ws)
--   print('got ws connection')
-- end)
-- ws:on("connection", function()
--   ws:send('hello!')
-- end)
-- ws:on("receive", function(_, msg, opcode)
--   print('got message:', msg, opcode) -- opcode is 1 for text message, 2 for binary
-- end)
-- ws:on("close", function(_, status)
--   print('connection closed', status)
--   ws = nil -- required to Lua gc the websocket client
-- end)

print(wifi.sta.getip())
print(wifi.sta.status())
--dofile('server.lua')
dofile('client.lua')
-- wifi config end
