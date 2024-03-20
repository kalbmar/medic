void UseCase_HealPlayer(int client) {
    int currentHealth = GetClientHealth(client);
    int randomHealth = GetRandomInt(ConVar_GetHealthRandomMin(), ConVar_GetHealthRandomMax());
    int newPlayerHealth = currentHealth + randomHealth; 

    if (newPlayerHealth > MAX_HEALTH) {
        newPlayerHealth = MAX_HEALTH;
    }

    Sound_PlayHealth(client);
	
    UseCase_SetHealth(client, newPlayerHealth);
}

void UseCase_SetHealth(int client, int health) {
    SetEntityHealth(client, health);
}
