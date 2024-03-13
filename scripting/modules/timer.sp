void Timer_HealPlayerAfterDelay(int client) {
    int userId = GetClientUserId(client);
    float timeBeforeRecovery = g_medicHealthDelay.FloatValue;

    g_timerHealth[client] = CreateTimer(timeBeforeRecovery, Timer_HealPlayer, userId, TIMER_HEAL_PLAYER_FLAGS);

    g_isPlayerHealed[client] = true;
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
