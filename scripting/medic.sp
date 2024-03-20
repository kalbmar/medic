#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <clientprefs>
#include <morecolors>

#include "use-case"
#include "cookie"
#include "timer"
#include "console-command"
#include "hook"
#include "menu"
#include "sound"

#include "modules/client.sp"
#include "modules/console-variable.sp"
#include "modules/cookie.sp"
#include "modules/console-command.sp"
#include "modules/event.sp"
#include "modules/menu.sp"
#include "modules/sound.sp"
#include "modules/timer.sp"
#include "modules/hook.sp"
#include "modules/use-case.sp"

#define CONFIG_CREATE_YES true

public Plugin myinfo = {
    name = "Medic",
    author = "Kalbmar",
    description = "Allows you to use medic",
    version = "1.0.0",
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
    Sound_Precach();
}

public void OnClientPutInServer(int client) {
    Hook_Create(client);
}

public void OnClientConnected(int client) {
    Timer_Reset(client);
}
