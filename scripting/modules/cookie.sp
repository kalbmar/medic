void Cookie_Create() {
    g_cookieNotificationLowHealth = RegClientCookie("play_sound_low_health", "Play sound by low health", CookieAccess_Private);

    SetCookieMenuItem(Menu_MedicNotification, 0,  MENU_HEADER);

    for (int i = 1; i <= MaxClients; i++) {
        if (AreClientCookiesCached(i)) {
            OnClientCookiesCached(i);
        }
    }
}

public void OnClientCookiesCached(int client) {
    char cookieValue[COOKIE_MAX_SIZE];

    GetClientCookie(client, g_cookieNotificationLowHealth, cookieValue, sizeof(cookieValue));

    if (cookieValue[0] == NULL_TERMINATOR) {
        g_cookieSoundNotice[client] = COOKIE_DEFAULT_VALUE;
    } else {
        g_cookieSoundNotice[client] = view_as<bool>(StringToInt(cookieValue));
    }
}

void Cookie_SetNotice(int client, bool enabled) {
    g_cookieSoundNotice[client] = enabled;

    SetClientCookie(client, g_cookieNotificationLowHealth, enabled ? SOUND_NOTICE_YES : SOUND_NOTICE_NO);
}
