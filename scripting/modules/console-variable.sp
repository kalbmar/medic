static ConVar g_medicHealthMin = null;
static ConVar g_medicHealthDelay = null;
static ConVar g_medicHealthRandomMin = null;
static ConVar g_medicHealthRandomMax = null;

void ConVar_Create() {
    g_medicHealthMin = CreateConVar("sm_medic_health_min", "40", "Minimum health to use medic");
    g_medicHealthDelay = CreateConVar("sm_medic_health_delay", "1.5", "Delay before treatment");
    g_medicHealthRandomMin = CreateConVar("sm_medic_health_random_min", "30", "Minimum random health to add");
    g_medicHealthRandomMax = CreateConVar("sm_medic_health_random_max", "50", "Maximum random health to add");
}

int ConVar_GetHealthMin() {
    return g_medicHealthMin.IntValue;
}

float ConVar_GetHealthDelay() {
    return g_medicHealthDelay.FloatValue;
}

int ConVar_GetHealthRandomMin() {
    return g_medicHealthRandomMin.IntValue;
}

int ConVar_GetHealthRandomMax() {
    return g_medicHealthRandomMax.IntValue;
}
