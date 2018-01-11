_currentLoadout = getUnitLoadout player;
_currentU_Items = _currentLoadout select 3;
_currentH = _currentLoadout select 6;
_currentUniform = _currentU_items select 0;
_civUniforms = [
  "U_LIB_CIV_Villager_1",
  "U_LIB_CIV_Villager_2",
  "U_LIB_CIV_Villager_3",
  "U_LIB_CIV_Woodlander_1",
  "U_LIB_CIV_Woodlander_2",
  "U_LIB_CIV_Woodlander_3",
  "U_LIB_CIV_Woodlander_4",
  "U_LIB_CIV_Worker_1",
  "U_LIB_CIV_Worker_2",
  "U_LIB_CIV_Worker_3",
  "U_LIB_CIV_Worker_4"
];

_civH = [
  "",
  "",
  "",
  "H_LIB_CIV_Villager_Cap_1",
  "H_LIB_CIV_Villager_Cap_1",
  "H_LIB_CIV_Villager_Cap_2",
  "H_LIB_CIV_Villager_Cap_2",
  "H_LIB_CIV_Villager_Cap_3",
  "H_LIB_CIV_Villager_Cap_3",
  "H_LIB_CIV_Villager_Cap_4",
  "H_LIB_CIV_Villager_Cap_4",
  "H_LIB_CIV_Worker_Cap_1",
  "H_LIB_CIV_Worker_Cap_1",
  "H_LIB_CIV_Worker_Cap_2",
  "H_LIB_CIV_Worker_Cap_2",
  "H_LIB_CIV_Worker_Cap_3",
  "H_LIB_CIV_Worker_Cap_3",
  "H_LIB_CIV_Worker_Cap_4",
  "H_LIB_CIV_Worker_Cap_4",
  "H_Bandanna_gry",
  "H_Bandanna_cbr",
  "H_Bandanna_khk",
  "H_Bandanna_blu",
  "H_Bandanna_sgg",
  "H_Bandanna_sand"
];

_newUniform = _civUniforms select (floor (random (count _civUniforms)));
_newHeadgear = _civH select (floor (random (count _civH)));
_newU_Items = _currentU_Items;
_newU_Items set [0, _newUniform];
_newLoadout = _currentLoadout;
_newLoadout set [3, _newU_items];
_newLoadout set [6, _newHeadgear];
player setUnitLoadout [_newLoadout, true];
