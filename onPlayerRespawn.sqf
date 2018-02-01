["Terminate"] call BIS_fnc_EGSpectator;

(_this select 1) spawn {
  sleep 60;  // delay before body sinks into ground (seconds)
  hidebody _this;
  sleep 5;
  deleteVehicle _this;
};

[player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;
player addWeapon (player getVariable ["currentWeapon", "bnae_mk1_virtual"]);

if ((typeof player) isEqualTo "LIB_US_AT_soldier") then {
  player addWeapon "fow_w_piat";
  player addMagazine "fow_1Rnd_piat_HEAT";
};

if ((typeOf player) isEqualto "LIB_US_second_lieutenant") exitWith {
  player setPos (player getVariable ["last_position", getMarkerPos "respawn_guerrila"]);
};

if ((typeOf player) isEqualTo "LIB_US_pilot") exitWith {
  player setPos (getMarkerPos "airfield");
};

_spawnUnits = ["CO", "XO", "able_slead", "able_sslead_1", "able_sslead_2", "able_sslead_3", "able_atlead_1", "able_atlead_2", "able_atlead_3", "able_btlead_1", "able_btlead_2", "able_btlead_3", "scout_slead"];
_dependentSpawns = ["able_atlead_1", "able_atlead_2", "able_atlead_3", "able_btlead_1", "able_btlead_2", "able_btlead_3"];
_independentSpawns = _spawnUnits - _dependentSpawns;

_respawnOnSamePosition = {
  _varNames = _this;
  _hasSpawned = false;
  {
    if (!isNil _x) then {
      if (player isEqualto (missionNamespace getVariable _x)) exitWith {
        player setPos (player getVariable ["last_position", getMarkerPos "respawn_guerrila"]);
        _hasSpawned = true;
      };
    };
  } forEach _varNames;
  _hasSpawned
};

_getAvailableSpawns = {
  _varNames = _this;
  _availableSpawns = [];
  {
    if (!isNil _x) then {
      _spawn = missionNamespace getVariable _x;
      if (alive _spawn) then {
        _availableSpawns pushBackUnique _spawn;
      };
    };
  } forEach _varNames;
  _availableSpawns;
};

_hasSpawned = _independentSpawns call _respawnOnSamePosition;

_spawnAtNearbyUnit = {
  _availableSpawns = _spawnUnits call _getAvailableSpawns;
  _nearbyUnits = nearestObjects [player getVariable ["last_position", [0,0,0]], ["Man"], 200, true];
  _nearbySpawns = (_nearbyUnits arrayIntersect _availableSpawns);
  if (({alive _x} count _nearbySpawns) > 0) exitWith {
    player setPos (getPos (_nearbySpawns select 0));
    true
  };
  false
};

if (_hasSpawned) exitWith {};

if ((typeOf player) in ["LIB_US_medic", "LIB_US_NAC_rifleman"]) exitWith {
  _hasSpawned = [] call _spawnAtNearbyUnit;
  if (!_hasSpawned) then {
    player setPos (getMarkerPos "respawn_guerrila");
  };
};

_spawnReference = player getVariable ["spawn_reference", "CO"];
if (!isNil _spawnReference) then {
  _spawnUnit = missionNamespace getVariable [_spawnReference, "CO"];
  if (alive _spawnUnit) then {
    player setPos (getPos _spawnUnit);
  } else {
    _hasSpawned = [] call _spawnAtNearbyUnit;
    if (!_hasSpawned) then {
      player setPos (getMarkerPos "respawn_guerrila");
    };
  };
};
