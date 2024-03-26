void Command_Create() {
    AddCommandListener(Command_VoiceMedic, "voice_medic");
    RegConsoleCmd("sm_medic", Command_Medic);
}

public Action Command_VoiceMedic(int client, const char[] command, int argc) {
    UseCase_CallMedic(client, PLAY_MEDIC_SOUND_NO);
	
    return Plugin_Continue;
}

public Action Command_Medic(int client, int agrs) {
    UseCase_CallMedic(client, PLAY_MEDIC_SOUND_YES);
	
    return Plugin_Handled;
}
