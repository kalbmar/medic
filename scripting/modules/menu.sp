void Menu_MedicNotification(int client, CookieMenuAction action, any info, char[] buffer, int maxlen) {
    if (action == CookieMenuAction_SelectOption) {
        Menu_Create(client);
		
    } else {
        Format(buffer, maxlen, "%T", MENU_HEADER, client);
    }
}

public void Menu_Create(int client) {
    Menu menu = new Menu(MenuSettings);

    menu.SetTitle("%T", MENU_HEADER, client);

    Menu_AddItem(menu, ITEM_ON, client);
    Menu_AddItem(menu, ITEM_OFF, client);
	
    menu.Display(client, MENU_TIME_FOREVER);
}

void Menu_AddItem(Menu menu, const char[] phrase, int client) {
    char item[ITEM_MAX_SIZE];

    Format(item, sizeof(item), "%T", phrase, client);

    menu.AddItem(phrase, item);
}

public int MenuSettings(Menu menu, MenuAction action, int param1, int param2) {
    if (action == MenuAction_Select) {
        char info[ITEM_MAX_SIZE];

        menu.GetItem(param2, info, sizeof(info));

        bool noticeEnabled = StrEqual(info, ITEM_ON);

        Cookie_SetNotice(param1, noticeEnabled);
		
        Menu_Create(param1);
    } else if (action == MenuAction_End) {
        delete menu;
    }

    return 0;
}
