params [["_planeType", ""], ["_spawn", "respawn_guerrila"], ["_initialSpeed", 150], ["_initialAlt", 100]];

_initialSpeed = _initialSpeed/3.6;

if (_planeType isEqualTo "") exitWith {hint "Error: No Plane Selected"};

_pos = getMarkerPos _spawn;

_rdir = random 359;
_rdist = random [35, 50, 100];

_pos set [0, (_pos select 0) + sin _rdir * _rdist];
_pos set [1, (_pos select 1) + cos _rdir * _rdist];
_pos set [2, (_pos select 2) + _initialAlt];

_dir = markerDir _spawn;

_plane = createVehicle [_planeType, _pos, [], 0, "FLY"];

if (_planeType isEqualto "LIB_C47_RAF") then {
  [_plane] spawn rmn_fnc_enableParadrop;
  _plane setVariable ["paradropAvailable", 4];
};

player moveInDriver _plane;

_plane setDir _dir;
_plane setVelocity [sin _dir * _initialSpeed, cos _dir * _initialSpeed, 0];
