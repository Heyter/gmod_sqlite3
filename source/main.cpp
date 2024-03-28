#include <GarrysMod/Lua/Interface.h>

extern "C" {
	#include <lsqlite3.h>
}

GMOD_MODULE_OPEN()
{
	luaopen_lsqlite3(LUA->GetState());
    return 0;
}

GMOD_MODULE_CLOSE()
{
	LUA->PushNil();
    LUA->SetField(GarrysMod::Lua::INDEX_GLOBAL, "sqlite3");
    return 0;
}
