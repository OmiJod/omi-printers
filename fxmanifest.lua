fx_version 'cerulean'

game 'gta5'

lua54 'yes'

version '2.0.0'

author 'Nullvalue#6848'

description 'moon-printers'

files {
    '*.lua',
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/*.png',
}

shared_script {
	'shared/*.lua',
}

client_scripts {
	'config.lua',
	'client/*.lua',
}

server_scripts {
	'config.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua',
}

-- dependencies {
-- 	'ps-ui',
-- 	'qb-target',
-- }

escrow_ignore {
    "config.lua"
}

ui_page 'html/index.html'
