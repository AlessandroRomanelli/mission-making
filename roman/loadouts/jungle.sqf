_currentLoadout = getUnitLoadout player;
_currentU_Items = _currentLoadout select 3;
_currentUniform = _currentU_items select 0;
_currentV_Items = _currentLoadout select 4;
_currentVest = _currentV_Items select 0;
_currentB_Items = _currentLoadout select 5;
_currentBackpack = _currentB_Items select 0;
_currentHeadgear = _currentLoadout select 6;
_initials = name player splitString "";
_initials resize 3;
_initials = toLower (_initials joinString "");
_newUniform = _initials call {
  switch (_this) do {
    case "pte": {"fow_u_uk_bd40_seac_01_private"};
    case "lcp": {"fow_u_uk_bd40_seac_01_lance_corporal"};
    case "cpl": {"fow_u_uk_bd40_seac_01_corporal"};
    case "sgt": {"fow_u_uk_bd40_seac_01_sergeant"};
    case "ssg": {"fow_u_uk_bd40_seac_01_sergeant"};
    case "2lt": {"fow_u_uk_bd40_seac_01_lieutenant"};
    case "lt.": {"fow_u_uk_bd40_seac_01_lieutenant"};
    case "sma": {"fow_u_uk_bd40_seac_01_lieutenant"};
    case "cpt": {"fow_u_uk_bd40_seac_01_lieutenant"};
    default {"fow_u_uk_bd40_seac_01_private"};
    };
  };
_newVest = _currentVest call {
  switch (_this) do {
    case "fow_v_uk_base": {"fow_v_uk_base_green";};
    case "fow_v_uk_bren": {"fow_v_uk_bren_green";};
    case "fow_v_uk_officer": {"fow_v_uk_officer_green";};
    case "fow_v_uk_sten": {"fow_v_uk_sten_green";};
    default {_this};
    };
  };
_newBackpack = _currentBackpack call {
  switch (_this) do {
    case "fow_b_uk_p37": {"fow_b_uk_p37_blanco"};
    case "fow_b_uk_p37_radio": {"fow_b_uk_p37_radio_blanco"};
    case "fow_b_uk_p37_shovel": {"fow_b_uk_p37_blanco_shovel"};
    case "fow_b_uk_bergenpack_desert": {"fow_b_uk_bergenpack"};
    default {_this};
    };
  };
_newHeadgear = _currentHeadgear call {
  switch (_this) do {
    case "fow_h_uk_beret_commando": {"fow_h_uk_jungle_hat_02"};
    default {"fow_h_uk_jungle_hat_01"};
    };
  };
_newV_Items = _currentV_Items;
_newV_Items set [0, _newVest];
_newU_Items = _currentU_Items;
_newU_Items set [0, _newUniform];
_newB_Items = _currentB_Items;
_newB_Items set [0, _newBackpack];
_newLoadout = _currentLoadout;
_newLoadout set [3, _newU_items];
_newLoadout set [4, _newV_Items];
_newLoadout set [5, _newB_Items];
_newLoadout set [6, _newHeadgear];
player setUnitLoadout [_newLoadout, true];

[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
