static Handle g_timerHealth[MAXPLAYERS + 1];

void Timer_HealPlayerAfterDelay(int client) {
    int userId = GetClientUserId(client);
    float timeBeforeRecovery = ConVar_GetHealthDelay();

    g_timerHealth[client] = CreateTimer(timeBeforeRecovery, Timer_HealPlayer, userId, TIMER_HEAL_PLAYER_FLAGS);

    Client_LowHealth(client);
}

public Action Timer_HealPlayer(Handle timer, int userId) {
    int client = GetClientOfUserId(userId);

    if (client == INVALID_CLIENT) {

        return Plugin_Continue;
    }

    if (IsPlayerAlive(client)) {
        UseCase_HealPlayer(client);
    }

    g_timerHealth[client] = null;

    return Plugin_Continue;
}

void Timer_Reset(int client) {
    g_timerHealth[client] = null;
}

void Timer_Delete(int client) {
    delete g_timerHealth[client];
}
