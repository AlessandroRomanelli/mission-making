if ((typeOf player) isEqualto "LIB_US_second_lieutenant") exitWith {
  player setVariable ["last_position", getPos player];
  setPlayerRespawnTime 0.01;
};

["Initialize", [player, [], false, false, true, false, true, true, true, true]] call BIS_fnc_EGSpectator;

[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
