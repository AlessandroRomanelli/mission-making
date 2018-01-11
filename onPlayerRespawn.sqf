["Terminate"] call BIS_fnc_EGSpectator;

{ _x addCuratorEditableObjects [[player], true];} foreach allCurators;

player setUnitLoadout [player getVariable ["Saved_Loadout", []], true];

[player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;

(_this select 1) spawn {
  sleep 60;  // delay before body sinks into ground (seconds)
  hidebody _this;
  sleep 5;
  deleteVehicle _this;
};

if ((typeOf player) isEqualto "LIB_US_second_lieutenant") exitWith {
  player setPos (player getVariable ["last_position", getMarkerPos "respawn_guerrila"]);
};

if (typeOf player == "LIB_USA_NCO_PilotM41VmPm1LtColt") exitWith {
  player setPos (getMarkerPos "airfield");
};


if (!isNil "HQ") then {
  if (alive HQ) then {
    player setPos (getPos HQ);
  };
} else {
  if (alive leader group player) then {
    player setPos (getPos (leader group player));
  } else {
    player setPos (getMarkerPos "respawn_guerrila");
  };
};
