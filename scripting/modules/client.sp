static bool g_isPlayerHealed[MAXPLAYERS + 1];
static bool g_isPlayerLowHealth[MAXPLAYERS + 1];

bool Client_IsHealed(int client) {
    return g_isPlayerHealed[client];
}

void Client_PlayerHealed(int client) {
    g_isPlayerHealed[client] = true;
}

bool Client_IsLowHealth(int client) {
    return g_isPlayerLowHealth[client];
}

void Client_SetLowHealth(int client) {
    g_isPlayerLowHealth[client] = true;
}

void Client_ResetHealthUses(int client) {
    g_isPlayerHealed[client] = false;
    g_isPlayerLowHealth[client] = false;
}
