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
player addVest "fow_v_uk_base";
for "_i" from 1 to 2 do {player addItemToVest "fow_e_no36mk1";};
for "_i" from 1 to 10 do {player addItemToVest "10Rnd_303_Magazine_no4";};
player addBackpack "fow_b_uk_p37_radio";
player addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_CableTie";};
for "_i" from 1 to 2 do {player addItemToBackpack "fow_e_no77";};
for "_i" from 1 to 2 do {player addItemToBackpack "fow_30Rnd_303_bren";};
player addItemToBackpack "murshun_cigs_matches";
for "_i" from 1 to 5 do {player addItemToBackpack "10Rnd_303_Magazine_no4";};
for "_i" from 1 to 3 do {player addItemToBackpack "LIB_1Rnd_flare_white";};
for "_i" from 1 to 3 do {player addItemToBackpack "LIB_1Rnd_flare_green";};
for "_i" from 1 to 3 do {player addItemToBackpack "LIB_1Rnd_flare_red";};
player addHeadgear "fow_h_uk_mk2";
player addWeapon "bnae_mk1_virtual";
player addWeapon "LIB_FLARE_PISTOL";
player addWeapon "CSA38_Binocular";

player selectWeapon "bnae_mk1_virtual";
player switchMove "amovpercmstpsraswrfldnon";

player addItem "itemCompass";
player addItem "itemWatch";
player addItem "itemMap";
player assignItem "itemCompass";
player assignItem "itemWatch";
player assignItem "itemMap";

[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
player setVariable ["currentWeapon", [] call bis_fnc_saveInventory select 6 select 0];
