["Initialize", [player, [], false, false, true, false, true, true, true, true]] call BIS_fnc_EGSpectator;

[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;

if (player == zeus1 || player == zeus2) then {
  player setVariable ["last_position", getPos player];
  setPlayerRespawnTime 0.01;
  ["Terminate"] call BIS_fnc_EGSpectator;
};
