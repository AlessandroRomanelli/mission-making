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

player addItemToUniform "BW_Facepaint";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_EarPlugs";};
player addItemToUniform "ACE_Flashlight_MX991";
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
player addItemToUniform "murshun_cigs_cigpack";
player addItemToUniform "murshun_cigs_matches";
player addVest "fow_v_uk_base";
for "_i" from 1 to 15 do {player addItemToVest "ACE_fieldDressing";};
for "_i" from 1 to 10 do {player addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToVest "ACE_packingBandage";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_tourniquet";};
for "_i" from 1 to 10 do {player addItemToVest "ACE_morphine";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_epinephrine";};
for "_i" from 1 to 2 do {player addItemToVest "ACE_adenosine";};
player addBackpack "fow_b_uk_bergenpack";
player addItemToBackpack "ACE_EntrenchingTool";
for "_i" from 1 to 10 do {player addItemToBackpack "10Rnd_303_Magazine";};
for "_i" from 1 to 2 do {player addItemToBackpack "fow_30Rnd_303_bren";};
for "_i" from 1 to 2 do {player addItemToBackpack "fow_6Rnd_455";};
for "_i" from 1 to 2 do {player addItemToBackpack "fow_e_no36mk1";};
for "_i" from 1 to 2 do {player addItemToBackpack "fow_e_no77";};

player addHeadgear "fow_h_uk_mk2_net";
player addWeapon "bnae_mk1_virtual";
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
