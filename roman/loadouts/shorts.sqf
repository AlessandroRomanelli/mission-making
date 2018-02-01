_currentLoadout = getUnitLoadout player;
_currentU_Items = _currentLoadout select 3;
_currentH = _currentLoadout select 6;
_currentUniform = _currentU_items select 0;
_newUniform = "U_mas_wwb_B_CombatUniform_uk";
_newU_Items = _currentU_Items;
_newU_Items set [0, _newUniform];
_newLoadout = _currentLoadout;
_newLoadout set [3, _newU_items];
player setUnitLoadout [_newLoadout, true];

[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
