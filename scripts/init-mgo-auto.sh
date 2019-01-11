#!/usr/bin/expect -f

spawn docker exec -it public-no-mongo mongo

send "use WeixinData4;\n"
send "exit;\n"

interact