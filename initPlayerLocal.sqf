CHBN_adjustBrightness = 0.3;
TF_speakerDistance = 50;
player setVariable ["ACE_GForceCoef", 1];
enableSentences false;
enableRadio false;
player addAction ["Roll-up/Roll-down sleeves", "roman\loadouts\shorts_jungle.sqf", nil, 1.5, false, true, "", "true", 15, false, ""];

admins = getArray(missionConfigFile >> "Whitelist"  >> "Admins" >> "members");
veterans = getArray(missionConfigFile >> "Whitelist" >> "Veterans" >> "members");
bronze = getArray(missionConfigFile >> "Whitelist" >> "Donators" >> "Bronze" >> "members");
silver = getArray(missionConfigFile >> "Whitelist" >> "Donators" >> "Silver" >> "members");
gold = getArray(missionConfigFile >> "Whitelist" >> "Donators" >> "Gold" >> "members");
whitelist = admins + veterans + bronze + silver + gold;
