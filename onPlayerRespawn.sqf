["Terminate"] call BIS_fnc_EGSpectator;

{ _x addCuratorEditableObjects [[player], true];} foreach allCurators;

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

if ((leader (group player)) != player) then {
  if (alive (leader (group player))) then {
    [(leader (group player))] spawn rmn_fnc_teleport;
  } else {
    if (!isNil "HQ") then {
      if (alive HQ) then {
        [HQ] spawn rmn_fnc_teleport;
      } else {
        player setPos (getMarkerPos "respawn_guerrila");
      };
    } else {
      player setPos (getMarkerPos "respawn_guerrila");
    };
  };
} else {
  if (!isNil "HQ") then {
    if (alive HQ) then {
      [HQ] spawn rmn_fnc_teleport;
    } else {
      player setPos (getMarkerPos "respawn_guerrila");
    };
  } else {
    player setPos (getMarkerPos "respawn_guerrila");
  };
};
