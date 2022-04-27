fx_version 'cerulean'
game 'gta5'

description 'QB-Printer'
version '1.0.0'

ui_page 'html/index.html'
client_script 'client/main.lua'
server_script 'server/main.lua'

files {
    '*.lua',
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/*.png',
}

lua54 'yes'