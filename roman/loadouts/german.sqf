_currentLoadout = getUnitLoadout player;
_currentU_Items = _currentLoadout select 3;
_currentH = _currentLoadout select 6;
_currentUniform = _currentU_items select 0;
_newUniform = "U_LIB_GER_rifleman_HeerGrsDldSch12K98";
_newHeadgear = "H_LIB_GER_Helmet_WHGD";
_newU_Items = _currentU_Items;
_newU_Items set [0, _newUniform];
_newLoadout = _currentLoadout;
_newLoadout set [3, _newU_items];
_newLoadout set [6, _newHeadgear];
player setUnitLoadout [_newLoadout, true];

player addVest "V_LIB_GER_VestKar98";
for "_i" from 1 to 6 do {player addItemToUniform "lib_5Rnd_792x57";};
for "_i" from 1 to 2 do {player addItemToVest "LIB_shg24";};
player addBackpack "B_LIB_GER_A_frame_K98";
for "_i" from 1 to 6 do {player addItemToBackpack "lib_5Rnd_792x57";};
player addWeapon "LIB_K98";

