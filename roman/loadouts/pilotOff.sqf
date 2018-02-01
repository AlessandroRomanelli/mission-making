removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "NO4_RAF_Jacket";
for "_i" from 1 to 6 do {player addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_EarPlugs";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_tourniquet";};
player addItemToUniform "US_Facepaint";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
player addItemToUniform "ACE_MapTools";
player addItemToUniform "ACE_personalAidKit";
for "_i" from 1 to 2 do {player addItemToBackpack "fow_6Rnd_455";};
player addItemToUniform "murshun_cigs_cigpack";
player addItemToUniform "murshun_cigs_matches";
player addVest "fow_v_uk_officer";
player addHeadgear "Raf_Cap";
player addGoggles "G_LIB_Watch1";
player addBackpack "B_LIB_SOV_RA_Paradrop";

player addWeapon "fow_w_webley";
player addWeapon "CSA38_Binocular";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "N_LIB_GER_Cap_Earphone";

[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
player setVariable ["currentWeapon", [] call bis_fnc_saveInventory select 6 select 0];
