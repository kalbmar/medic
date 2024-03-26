void Hook_Create(int client) {
    SDKHook(client, SDKHook_OnTakeDamageAlivePost, Hook_OnTakeDamageAlivePost);
}

public void Hook_OnTakeDamageAlivePost(int victim, int attacker, int inflictor, float damage, int damagetype) {
    int currentHealth = GetClientHealth(victim);

    if (Client_IsLowHealth(victim) || !Cookie_IsSoundNotice(victim)) {
        return;
    }

    bool notificationLowHealth = PLAYER_DEAD < currentHealth <= ConVar_GetHealthMin();
	
    if (notificationLowHealth) {
        Client_SetLowHealth(victim);
        Sound_PlayLowHealth(victim);
    }
}
