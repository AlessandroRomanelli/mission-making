clearAllItemsFromBackpack player;
clearBackpackCargo player;
removeAllWeapons player;
removeAllItems player;
removeBackpack player;
removeHeadgear player;
removeUniform player;
removeVest player;
{player unassignItem _x;player removeItem _x} forEach assignedItems player;

comment "Add containers";
player forceAddUniform "fow_u_uk_bd40_kieffer_no4";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_EarPlugs";};
for "_i" from 1 to 5 do {player addItemToUniform "ACE_epinephrine";};
player addItemToUniform "ACE_CableTie";
player addItemToUniform "murshun_cigs_matches";
player addItemToUniform "murshun_cigs_cigpack";
for "_i" from 1 to 3 do {player addItemToUniform "fow_e_no77";};
player addVest "fow_v_uk_base";
for "_i" from 1 to 25 do {player addItemToVest "ACE_fieldDressing";};
for "_i" from 1 to 30 do {player addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 30 do {player addItemToVest "ACE_packingBandage";};
for "_i" from 1 to 4 do {player addItemToVest "ACE_tourniquet";};
for "_i" from 1 to 5 do {player addItemToVest "ACE_adenosine";};
for "_i" from 1 to 20 do {player addItemToVest "ACE_morphine";};
for "_i" from 1 to 10 do {player addItemToVest "ACE_epinephrine";};
player addItemToVest "ACE_surgicalKit";
player addBackpack "B_LIB_SOV_RA_MedicalBag_Empty";
for "_i" from 1 to 6 do {player addItemToBackpack "ACE_bloodIV_500";};
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_plasmaIV_500";};
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV_500";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV_250";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_plasmaIV_250";};
for "_i" from 1 to 3 do {player addItemToBackpack "10Rnd_303_Magazine";};
player addHeadgear "fow_h_uk_mk2_medic";

player addWeapon "bnae_mk1_virtual";
player addWeapon "CSA38_Binocular";
player switchMove "amovpercmstpsraswrfldnon";

player addItem "itemCompass";
player addItem "itemWatch";
player addItem "itemMap";
player assignItem "itemCompass";
player assignItem "itemWatch";
player assignItem "itemMap";


