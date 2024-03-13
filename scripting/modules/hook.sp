void Hook_Create(int client) {
    SDKHook(client, SDKHook_OnTakeDamageAlivePost, Hook_OnTakeDamageAlivePost);
}

public void Hook_OnTakeDamageAlivePost(int victim, int attacker, int inflictor, float damage, int damagetype) {
    int currentHealth = GetClientHealth(victim);

    if (g_isPlayerLowHealth[victim] || !g_cookieSoundNotice[victim]) {
        return;
    }

    bool notyficationLowHealth = PLAYER_DEAD < currentHealth <= g_medicHealthMin.IntValue;
	
    if (notyficationLowHealth) {
        g_isPlayerLowHealth[victim] = true;
		
        Sound_PlayLowHealth(victim);
    }
}
