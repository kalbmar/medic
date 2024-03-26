void UseCase_CallMedic(int client, bool playMedicSound) {
    int currentHealth = GetClientHealth(client);
    bool allowToUseMedic = currentHealth <= ConVar_GetHealthMin();

    if (!IsPlayerAlive(client)) {
        CReplyToCommand(client, "%t%t", "Prefix", "Dead player");

        return;
    }

    if (!allowToUseMedic) {
        CReplyToCommand(client, "%t%t", "Prefix", "Full health");

        return;
    }

    if (Client_IsHealed(client)) {
        CReplyToCommand(client, "%t%t", "Prefix", "Already used medic");

        return;
    }

    Sound_PlayMedic(client, playMedicSound);

    Timer_HealPlayerAfterDelay(client);
}

void UseCase_HealPlayer(int client) {
    int currentHealth = GetClientHealth(client);
    int healthRandomMin = ConVar_GetHealthRandomMin();
    int healthRandomMax = ConVar_GetHealthRandomMax();
    int randomHealth = GetRandomInt(healthRandomMin, healthRandomMax);
    int newPlayerHealth = currentHealth + randomHealth; 

    if (newPlayerHealth > MAX_HEALTH) {
        newPlayerHealth = MAX_HEALTH;
    }

    Sound_PlayHealth(client);
    SetEntityHealth(client, newPlayerHealth);
}
