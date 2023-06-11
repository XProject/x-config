fx_version "cerulean"
use_experimental_fxv2_oal "yes"
lua54 "yes"
game "gta5"

name "x-config"
version "0.1.0"
repository "https://github.com/XProject/x-config"
description "Project-X Config: Multiple Small Resources With Their Correspondong APIs"

files {
    "files/*"
}

shared_scripts {
    "@ox_lib/init.lua",
    "shared/*.lua"
}

server_scripts {
    "server/*.lua"
}

client_scripts {
    "client/*.lua",
}

escrow_ignore {
    "files/*",
    "shared/*.lua",
    "server/*.lua",
    "client/*.lua",
}
