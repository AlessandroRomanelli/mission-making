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
for "_i" from 1 to 2 do {player addItemToVest "fow_e_no73";};
for "_i" from 1 to 2 do {player addItemToVest "fow_e_no77";};
for "_i" from 1 to 9 do {player addItemToVest "10Rnd_303_Magazine";};
player addBackpack "fow_b_uk_p37";
player addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_CableTie";};
player addItemToBackpack "murshun_cigs_matches";
for "_i" from 1 to 6 do {player addItemToBackpack "10Rnd_303_Magazine";};
for "_i" from 1 to 2 do {player addItemToBackpack "fow_1Rnd_piat_HEAT";};
player addItemToBackpack "fow_1Rnd_piat_HE";
player addHeadgear "fow_h_uk_woolen_hat";
player addWeapon "bnae_mk1_virtual";
player selectWeapon "bnae_mk1_virtual";
player switchMove "amovpercmstpsraswrfldnon";

player addItem "itemCompass";
player addItem "itemWatch";
player addItem "itemMap";
player assignItem "itemCompass";
player assignItem "itemWatch";
player assignItem "itemMap";


