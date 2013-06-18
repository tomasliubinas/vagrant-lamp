# OXID eShop CE setup constants

# SETUP CONFIGURATION
# change these as you wish
# default[:oxideshop][:admin_user]  = "admin"
# default[:oxideshop][:admin_password]  = "admin"

# default shop language. Leave "" for the default one (German) or set "en" to switch it to english
default[:oxideshop][:language]  = ""

# UTF shop? set "0" or "1"
default[:oxideshop][:utf]  =  "0"


# debug option
default[:oxideshop][:debug]  = "0"


# SERVER CONFIGURATION
# change this carefully according to your server configuration

# default MySQL connection parameters
default[:oxideshop][:mysql_host]      =  "localhost"
default[:oxideshop][:mysql_username]  =  "root"
default[:oxideshop][:mysql_password]  =  "root"
default[:oxideshop][:mysql_database]  =  "oxideshop"

# source GIT repository
default[:oxideshop][:src]   = "https://github.com/tomasliubinas/oxideshop_ce.git"

# shop dir
default[:oxideshop][:dir]       = "/home/oxideshop/"

# shop URL
default[:oxideshop][:url]  = "http://oxideshop/"