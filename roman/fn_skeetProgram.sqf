params ["_launcher", "_mode"];

switch (_mode) do {
  case (0): { // Single
    [_launcher] spawn {
      _launcher = param [0, objNull, [objNull]];
      _pos = getPosWorld _launcher;
      _pos set [2, (_pos select 2) + 1.5];
      _skeet = "Skeet_Clay_F" createVehicle _pos;
      [_skeet, _launcher] spawn rmn_fnc_launchSkeet;
    };
  };
  case (1): { // Double

  };
  case (2): { // 5 in 10

  };
  case (3): { // 10 in 20

  };
  case (4): { // 5 in 5

  };
  case (5): { // 10 in 10

  };
};
