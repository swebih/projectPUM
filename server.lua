-- Connect
print('\nServer running\n')
tmr.alarm(0, 1000, 1, function()
   if wifi.sta.getip() == nil then
      print("Connecting to AP...\n")
   else
      ip, nm, gw=wifi.sta.getip()
      print("IP Info: \nIP Address: ",ip)
      print("Netmask: ",nm)
      print("Gateway Addr: ",gw,'\n')
      tmr.stop(0)
   end
end)

 -- Start a simple http server
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
  conn:on("receive",function(conn,payload)
    local string = payload
    print(string)
    conn:send("Välkommen till Servern \n")
    -- key = "1234567890abcdef"
    -- cipher = crypto.encrypt("AES-ECB", key, payload)
    -- print(crypto.toHex(cipher))
    -- conn:send(cipher)
  end)
  if payload == 'q' then
    conn:on("sent",function(conn) conn:close() end)
  end
end)
