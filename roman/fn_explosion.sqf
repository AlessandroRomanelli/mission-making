params ["_pos1", "_pos2"];
[4] spawn bis_fnc_earthquake;
if (isServer) then {
  for "_i" from 1 to 10 do {
    _pos1 = getPos explosion_1;
    _dir1 = random 359;
    _pos1 set [0, (_pos1 select 0)+5*sin(_dir1)];
    _pos1 set [1, (_pos1 select 1)+5*cos(_dir1)];
    "HelicopterExploBig" createVehicle _pos1;
    {_x setDamage 1} forEach nearestObjects [_pos1, [], 60];
    if (isNil _pos2) exitWith {sleep random [0, 0.125, 1];};
    _pos2 = getPos explosion_2;
    _dir2 = random 359;
    _pos2 set [0, (_pos2 select 0)+5*sin(_dir2)];
    _pos2 set [1, (_pos2 select 1)+5*cos(_dir2)];
    "HelicopterExploBig" createVehicle _pos2;
    {_x setDamage 1} forEach nearestObjects [_pos2, [], 15];
    sleep random [0, 0.125, 1];
  };
};
