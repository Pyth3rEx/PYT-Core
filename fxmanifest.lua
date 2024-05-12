fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'Pyth3rEx'
description 'PYT_Core resource'
version '0.0.0'

shared_scripts {
    'shared/config.lua',
    'shared/shared.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client/mainClient.lua'
}

server_scripts {
    'server/mainServer.lua'
}

dependencies {
    'ox_lib',
}

server_export {
    'debugPrinter',
    'ressourceChecker',
    'tableToString',
}