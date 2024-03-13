char g_medicSounds[][] = {
    "player/american/us_medic.wav",
    "player/american/us_medic2.wav",
    "player/german/ger_medic.wav",
    "player/german/ger_medic2.wav"
};

Handle g_timerHealth[MAXPLAYERS + 1];
Handle g_cookieNotificationLowHealth = null;

ConVar g_medicHealthMin = null;
ConVar g_medicHealthDelay = null;
ConVar g_medicHealthRandomMin = null;
ConVar g_medicHealthRandomMax = null;

bool g_isPlayerHealed[MAXPLAYERS + 1];
bool g_isPlayerLowHealth[MAXPLAYERS + 1];
bool g_cookieSoundNotice[MAXPLAYERS + 1] = {COOKIE_DEFAULT_VALUE, ...};
