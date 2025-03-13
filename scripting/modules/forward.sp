static GlobalForward g_permissionsPlayer;

void Forward_Create() {
    g_permissionsPlayer = new GlobalForward("Medic_OnUse", ET_Hook, Param_Cell);
}

Action Forward_Medic_OnUse(int client) {
    Action result = Plugin_Continue;

    Call_StartForward(g_permissionsPlayer);
    Call_PushCell(client);
    Call_Finish(result);

    return result;
}
