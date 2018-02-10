CHBN_adjustBrightness = 0.3;
TF_speakerDistance = 25;
enableSentences false;
enableRadio false;

admins = getArray(missionConfigFile >> "Whitelist"  >> "Admins" >> "members");
veterans = getArray(missionConfigFile >> "Whitelist" >> "Veterans" >> "members");
bronze = getArray(missionConfigFile >> "Whitelist" >> "Donators" >> "Bronze" >> "members");
silver = getArray(missionConfigFile >> "Whitelist" >> "Donators" >> "Silver" >> "members");
gold = getArray(missionConfigFile >> "Whitelist" >> "Donators" >> "Gold" >> "members");
whitelist = admins + veterans + bronze + silver + gold;
