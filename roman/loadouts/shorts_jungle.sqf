_currentLoadout = getUnitLoadout player;
_currentU_Items = _currentLoadout select 3;
_currentUniform = _currentU_items select 0;
_newUniform = _currentUniform call {switch (_this) do {
  case "fow_u_uk_bd40_seac_01_private": {"fow_u_uk_bd40_seac_02_private";};
  case "fow_u_uk_bd40_seac_02_private": {"fow_u_uk_bd40_seac_01_private";};
  case "fow_u_uk_bd40_seac_01_lance_corporal": {"fow_u_uk_bd40_seac_02_lance_corporal";};
  case "fow_u_uk_bd40_seac_02_lance_corporal": {"fow_u_uk_bd40_seac_01_lance_corporal";};
  case "fow_u_uk_bd40_seac_01_corporal": {"fow_u_uk_bd40_seac_02_corporal";};
  case "fow_u_uk_bd40_seac_02_corporal": {"fow_u_uk_bd40_seac_01_corporal";};
  case "fow_u_uk_bd40_seac_01_sergeant": {"fow_u_uk_bd40_seac_02_sergeant";};
  case "fow_u_uk_bd40_seac_02_sergeant": {"fow_u_uk_bd40_seac_01_sergeant";};
  case "fow_u_uk_bd40_seac_01_lieutenant": {"fow_u_uk_bd40_seac_02_lieutenant";};
  case "fow_u_uk_bd40_seac_02_lieutenant": {"fow_u_uk_bd40_seac_01_lieutenant";};
  default {_this};
};};
_newU_Items = _currentU_Items;
_newU_Items set [0, _newUniform];
_newLoadout = _currentLoadout;
_newLoadout set [3, _newU_items];
player setUnitLoadout [_newLoadout, true];

[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
