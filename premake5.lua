PROJECT_GENERATOR_VERSION = 2

newoption({
	trigger = "gmcommon",
	description = "Sets the path to the garrysmod_common (https://github.com/danielga/garrysmod_common) directory",
	value = "path to garrysmod_common directory"
})

local gmcommon = assert(_OPTIONS.gmcommon or os.getenv("GARRYSMOD_COMMON"),
	"you didn't provide a path to your garrysmod_common (https://github.com/danielga/garrysmod_common) directory")
include(gmcommon)

local SQLITE_DIRECTORY = "lsqlite3"

CreateWorkspace({name = "sqlite3"})
	CreateProject({serverside = true})
		includedirs(SQLITE_DIRECTORY)
		links("lsqlite3")
		IncludeLuaShared()

		filter("system:linux")

	project("lsqlite3")
		kind("StaticLib")
		warnings("Default")
		includedirs(SQLITE_DIRECTORY)
		externalincludedirs(_GARRYSMOD_COMMON_DIRECTORY .. "/include")
		files({path.join(SQLITE_DIRECTORY, "*.c"), path.join(SQLITE_DIRECTORY, "*.h")})
		vpaths({
			["Source files/*"] = path.join(SQLITE_DIRECTORY, "*.c"),
			["Header files/*"] = path.join(SQLITE_DIRECTORY, "*.h")
		})
		IncludeLuaShared()

		filter("system:linux")
			defines("_GNU_SOURCE")
