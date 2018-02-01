player setVariable ["last_position", getPos player];

if ((typeOf player) isEqualto "LIB_US_second_lieutenant") exitWith {
  setPlayerRespawnTime 0.01;
};

[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;

["Initialize", [player, [], false, false, true, false, true, true, true, true]] call BIS_fnc_EGSpectator;

if (((typeOf player) isEqualto "LIB_US_captain") || ((typeOf player) isEqualto "LIB_US_first_lieutenant")) exitWith {
  setPlayerRespawnTime 90;
};

if ((typeOf player) isEqualto "LIB_US_corporal") exitWith {
  setPlayerRespawnTime 120;
};

if ((typeOf player) isEqualto "LIB_US_FC_rifleman") exitWith {
  setPlayerRespawnTime 180;
};

if ((typeOf player) isEqualto "LIB_US_smgunner") exitWith {
  setPlayerRespawnTime 180;
};
