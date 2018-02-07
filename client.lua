-- client
print("Connecting to Server..")
client=tls.createConnection()
ip = "10.90.192.215"
--hello = tls.socket:connect(80, ip)
client:on("connection", function(sck, c) print(c) end)
client:connect(80, ip)

key = "1234567890abcdef"
cipher = crypto.encrypt("AES-ECB", key, "Hi, I'm secret!")
print(crypto.toHex(cipher))

client:send(crypto.toHex(cipher))
