void ConVar_Create() {
    g_medicHealthMin = CreateConVar("sm_medic_health_min", "40", "Minimum health to use medic");
    g_medicHealthDelay = CreateConVar("sm_medic_health_delay", "1.5", "Delay before treatment");
    g_medicHealthRandomMin = CreateConVar("sm_medic_health_random_min", "30", "Minimum random health to add");
    g_medicHealthRandomMax = CreateConVar("sm_medic_health_random_max", "50", "Maximum random health to add");
}
