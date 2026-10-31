fx_version 'cerulean'
game 'gta5'
author 'WGC Systems UG'
description 'Resource for integrating Copnet etc. into FiveM'
version '3.2.3'


client_scripts {
  'shared/config.lua',
  'shared/target.lua',
  'client/cl_utils.lua',
  'client/client.lua',
  --'client/api_client.lua',
}

ui_page "html/index.html"

server_scripts {
  --German
  --Im falle eines Fehlers, bezüglich der MySQL verbindung, aktivert bitte @mysql-async/lib/MySQL.lua.
  --Das macht Ihr, indem Ihr die zwei "-" zeichen entfernt.
  --Ihr müsst anschließend noch die "-" zeichen vor '@oxmysql/lib/MySQL.lua', einfügen!

  --Englisch
  --In case of an error concerning the MySQL connection, please activate @mysql-async/lib/MySQL.lua.
  --You do this by removing the two "-" characters.
  --You have to add the "-" characters in front of '@oxmysql/lib/MySQL.lua'!
  
  '@oxmysql/lib/MySQL.lua',
  --'@mysql-async/lib/MySQL.lua',
  'shared/config.lua',
  'server/sv_utlis.lua',
  --'shared/api_config.lua',
  --'server/api_server.lua',
  'server/server.lua',
}

files {
  "html/index.html",
  "html/script.js",
  "html/style.css",
  "html/tablet.png",
  "html/tablet-s.png",
  "html/tablet-us.png"
}

lua54 'yes'

escrow_ignore {
  'shared/config.lua',
  'vpc-ls.sql',
  'vpc-owned_vehicle.sql',
  'shared/ENGLISH_config.lua',
  'client/cl_utils.lua',
  'server/sv_utlis.lua',
  'shared/target.lua',
  'shared/ENGLISH_target.lua',
}

