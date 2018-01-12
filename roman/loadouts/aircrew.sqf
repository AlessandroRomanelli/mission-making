removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "NO4_RAF_suit";
for "_i" from 1 to 4 do {player addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_EarPlugs";};
player addItemToUniform "US_Facepaint";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
player addItemToUniform "ACE_MapTools";
player addItemToUniform "ACE_personalAidKit";
for "_i" from 1 to 2 do {player addItemToUniform "sab_wwiplanes_6rnd_revolver_mag";};
for "_i" from 1 to 3 do {player addItemToUniform "fow_6Rnd_455";};
player addItemToUniform "murshun_cigs_cigpack";
player addItemToUniform "murshun_cigs_matches";
player addVest "fow_v_us_45";
player addItemToVest "LIB_US_M18";
player addBackpack "B_LIB_US_Type5";
player addHeadgear "fow_h_us_flight_helmet";

player addWeapon "fow_w_webley";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "LIB_GER_Headset";


