fx_version 'cerulean'
game 'gta5'

name "rPed"
description "Menu Ped"
author "RedMXT"
version "1.0.0"


client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
}

client_scripts {
	'client/cl_main.lua',
	'config.lua'
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	'server/sv_main.lua'
}
