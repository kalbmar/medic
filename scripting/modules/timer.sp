static Handle g_timerRefillHealth[MAXPLAYERS + 1];

void Timer_HealPlayerAfterDelay(int client) {
    int userId = GetClientUserId(client);
    float timeBeforeRecovery = ConVar_GetHealthDelay();

    g_timerRefillHealth[client] = CreateTimer(timeBeforeRecovery, Timer_HealPlayer, userId, TIMER_HEAL_PLAYER_FLAGS);

    Client_SetLowHealth(client);
}

public Action Timer_HealPlayer(Handle timer, int userId) {
    int client = GetClientOfUserId(userId);

    if (client == INVALID_CLIENT) {
        return Plugin_Continue;
    }

    if (IsPlayerAlive(client)) {
        UseCase_HealPlayer(client);
    }

    g_timerRefillHealth[client] = null;

    return Plugin_Continue;
}

void Timer_RefillHealthReset(int client) {
    g_timerRefillHealth[client] = null;
}

void Timer_RefillHealthDelete(int client) {
    delete g_timerRefillHealth[client];
}
