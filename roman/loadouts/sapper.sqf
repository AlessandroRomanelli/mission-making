clearAllItemsFromBackpack player;
clearBackpackCargo player;
removeAllWeapons player;
removeAllItems player;
removeBackpack player;
removeHeadgear player;
removeUniform player;
removeVest player;
{player unassignItem _x;player removeItem _x} forEach assignedItems player;

player forceAddUniform "fow_u_uk_bd40_kieffer_no4";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_EarPlugs";};
for "_i" from 1 to 10 do {player addItemToUniform "ACE_fieldDressing";};
player addItemToUniform "US_Facepaint";
player addItemToUniform "murshun_cigs_cigpack";
player addVest "fow_v_uk_sten";
for "_i" from 1 to 2 do {player addItemToVest "fow_e_no36mk1";};
for "_i" from 1 to 10 do {player addItemToVest "LEN_32Rnd_9x19";};
for "_i" from 1 to 2 do {player addItemToVest "fow_e_no77";};
player addBackpack "fow_b_uk_p37";
player addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_CableTie";};
player addItemToBackpack "ACE_LIB_LadungPM";
player addItemToBackpack "ACE_DefusalKit";
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_LIB_FireCord";};
for "_i" from 1 to 2 do {player addItemToBackpack "fow_30Rnd_303_bren";};
player addItemToBackpack "murshun_cigs_matches";
for "_i" from 1 to 5 do {player addItemToBackpack "LEN_32Rnd_9x19";};
for "_i" from 1 to 2 do {player addItemToBackpack "fow_e_no69";};
for "_i" from 1 to 4 do {player addItemToBackpack "LIB_Ladung_Small_MINE_mag";};
player addHeadgear "fow_h_uk_woolen_hat";

comment "Add weapons";
player addWeapon "LEN_StenMk2";
player selectWeapon "LEN_StenMk2";
player switchMove "amovpercmstpsraswrfldnon";

player addItem "itemCompass";
player addItem "itemWatch";
player addItem "itemMap";
player assignItem "itemCompass";
player assignItem "itemWatch";
player assignItem "itemMap";


