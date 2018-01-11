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
player addVest "fow_v_uk_sten";
for "_i" from 1 to 2 do {player addItemToVest "fow_e_no36mk1";};
for "_i" from 1 to 2 do {player addItemToVest "fow_e_no77";};
for "_i" from 1 to 10 do {player addItemToVest "LEN_32Rnd_9x19";};
player addItemToVest "ACE_EntrenchingTool";
player addItemToVest "murshun_cigs_matches";
for "_i" from 1 to 2 do {player addItemToVest "ACE_CableTie";};
player addBackpack "fow_b_uk_vickers_weapon";
player addHeadgear "fow_h_uk_woolen_hat";
player addWeapon "LEN_StenMk2";
player selectWeapon "LEN_StenMk2";
player switchMove "amovpercmstpsraswrfldnon";

player addItem "itemCompass";
player addItem "itemWatch";
player addItem "itemMap";
player assignItem "itemCompass";
player assignItem "itemWatch";
player assignItem "itemMap";

player setVariable ["Saved_Loadout", getUnitLoadout player];
