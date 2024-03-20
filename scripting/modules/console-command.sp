void Command_Create() {
    AddCommandListener(Command_VoiceMedic, "voice_medic");
    RegConsoleCmd("sm_medic", Command_Medic);
}

public Action Command_VoiceMedic(int client, const char[] command, int argc) {
    Command_CallMedic(client, PLAY_MEDIC_SOUND_NO);
	
    return Plugin_Continue;
}

public Action Command_Medic(int client, int agrs) {
    Command_CallMedic(client, PLAY_MEDIC_SOUND_YES);
	
    return Plugin_Handled;
}

void Command_CallMedic(int client, bool playMedicSound) {
    int currentHealth = GetClientHealth(client);
    bool allowToUseMedic = currentHealth <= g_medicHealthMin.IntValue;

    if (!IsPlayerAlive(client)) {
        CReplyToCommand(client, "%t%t", "Prefix", "Dead player");

        return;
    }

    if (!allowToUseMedic) {
        CReplyToCommand(client, "%t%t", "Prefix", "Full health");

        return;
    }

    if (g_isPlayerHealed[client]) {
        CReplyToCommand(client, "%t%t", "Prefix", "Already used medic");

        return;
    }

    Sound_PlayMedic(client, playMedicSound);

    Timer_HealPlayerAfterDelay(client);
}
