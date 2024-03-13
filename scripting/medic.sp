#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <clientprefs>
#include <morecolors>

#include "constant"

#include "modules/variables.sp"
#include "modules/con-var.sp"
#include "modules/cookie.sp"
#include "modules/command.sp"
#include "modules/event.sp"
#include "modules/menu.sp"
#include "modules/sound.sp"
#include "modules/timer.sp"
#include "modules/hook.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Medic",
    author = "Kalbmar",
    description = "Allows you to use medic",
    version = "0.1.0",
    url = "https://github.com/kalbmar/medic",
};

public void OnPluginStart() {
    ConVar_Create();
    Cookie_Create();
    Command_Create();
    Event_Create();

    LoadTranslations("medic.phrases");
    AutoExecConfig(CONFIG_CREATE_YES, "medic");
}

public void OnMapStart() {
    for (int i = 0; i < sizeof(g_medicSounds); i++) {
        PrecacheSound(g_medicSounds[i], PRELOAD_YES);
    }
	
    PrecacheSound(HEALTH_SOUND, PRELOAD_YES);
    PrecacheSound(HEALTH_LOW_SOUND, PRELOAD_YES);
}

public void OnClientPutInServer(int client) {
    Hook_Create(client);
}

public void OnClientConnected(int client) {
    g_timerHealth[client] = null;
}
