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
for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
player addItemToUniform "US_Facepaint";
player addItemToUniform "murshun_cigs_cigpack";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_EarPlugs";};
for "_i" from 1 to 10 do {player addItemToUniform "ACE_fieldDressing";};
player addVest "fow_v_uk_base";
for "_i" from 1 to 2 do {player addItemToVest "fow_e_no36mk1";};
for "_i" from 1 to 2 do {player addItemToVest "fow_e_no77";};
player addBackpack "fow_b_uk_p37";
for "_i" from 1 to 10 do {player addItemToBackpack "LIB_50Rnd_762x63";};
player addItemToVest "ACE_EntrenchingTool";
player addItemToVest "murshun_cigs_matches";
for "_i" from 1 to 2 do {player addItemToVest "ACE_CableTie";};
player addHeadgear "fow_h_uk_woolen_hat";
player addWeapon "LIB_M1919A4";
player selectWeapon "LIB_M1919A4";
player switchMove "amovpercmstpsraswrfldnon";

player addItem "itemCompass";
player addItem "itemWatch";
player addItem "itemMap";
player assignItem "itemCompass";
player assignItem "itemWatch";
player assignItem "itemMap";

[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
player setVariable ["currentWeapon", [] call bis_fnc_saveInventory select 6 select 0];
