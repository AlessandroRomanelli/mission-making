params [["_mode", 0], ["_plane", objNull]];

removeAllActions _plane;

_pitchBank = _plane call bis_fnc_getPitchBank;
_isLevel = (_pitchBank select 0 > -2.5) && (_pitchBank select 0 < 2.5) && (_pitchBank select 1 > -5) && (_pitchBank select 1 < 5);
_vel = velocity _plane;
_pos = getPosWorld _plane;
_dir = getDir _plane;
_pos set [0, (_pos select 0) - (sin _dir * 5 )];
_pos set [1, (_pos select 1) - (cos _dir * 5 )];
_paradropsLeft = _plane getVariable "paradropAvailable";
_plane setVariable ["paradropAvailable", _paradropsLeft - 1];

hint "Paradrop initiated...";
if ((speed _plane < 175) && ((_pos select 2) > 100) && _isLevel) then {
  _parachute = createVehicle ["B_Parachute_02_F", _pos, [], 0, "FLY"];
  _box = [] call {
    switch (_mode) do {
      case (0): {
        "no4_BasicWeaponsBox_UK" createVehicle _pos;
      };
      case (1): {
        "no4_BasicAmmoBox_UK" createVehicle _pos;
      };
      case (2): {
        "no4_ExplosivesBox_UK" createVehicle _pos;
      };
      case (4): {
        "ACE_medicalSupplyCrate_advanced" createVehicle _pos;
      };
      default {
        "no4_BasicAmmoBox_UK" createVehicle _pos;
      };
    };
  };
  _box attachTo [_parachute, [0, 0, -0.5]];
  _box allowDamage false;
  _parachute setVelocity _vel;
  sleep 0.5;
  _message = "Paradrop successfully carried out!";
  if (_paradropsLeft > 1) then {
    _message = _message + "\n Watch out, you still have " + str _paradropsLeft + " paradrops left!";
  } else {
    _message = _message + "\n This was your last paradrop available, return to base!";
  };
  hint _message;
} else {
  sleep 0.5;
  _error = "Paradrop failed for the following reasons:";
  if (speed _plane >= 175) then {
    _error = _error + "\n - You were flying faster than 175km/h;";
  };
  if (_pos select 2 < 100) then {
    _error = _error + "\n - You were flying lower than 100m;";
  };
  if (!_isLevel) then {
    _error = _error + "\n - You were not flying level.";
  };
  hint _error;
};
sleep 1;
[_plane] spawn rmn_fnc_enableParadrop;
