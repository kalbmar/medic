void Sound_PlayMedic(int client, bool playMedicSound) {
    int team = GetClientTeam(client);
    int medicVersion = GetRandomInt(MEDIC_VERSION_FIRST, MEDIC_VERSION_SECOND);
    int soundOffset = (team - TEAM_ALLIES) * MEDIC_VERSIONS_AMOUNT + medicVersion;

    if (playMedicSound) {
        Sound_PlayVoice(soundOffset, client);
    }
}

void Sound_PlayVoice(int soundOffset, int client) {
    EmitSoundToAll(g_medicSounds[soundOffset], client, SNDCHAN_VOICE, SNDLEVEL_NORMAL);
}

void Sound_PlayHealth(int client) {
    EmitSoundToClient(client, HEALTH_SOUND, client, SNDCHAN_ITEM, SNDLEVEL_CAR);
}

void Sound_PlayLowHealth(int victim) {
    EmitSoundToClient(victim, HEALTH_LOW_SOUND, victim, SNDCHAN_ITEM, SNDLEVEL_CAR);
}
