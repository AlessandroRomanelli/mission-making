if (!isServer) exitWith {};

/* Condtion: this && (({_x isKindOf "Air"} count thisList) > 0)
Act: [thisList, 100, 300, thisTrigger] spawn rmn_fnc_flak;
Deact: thisTrigger setVariable ["activeFlak", false]; */

params[["_thisList", []], ["_minAlt", 100], ["_zero", 300], ["_firingPos", objNull]];
/*_targetPos = getPosATL _firingPos;
_targetPos set [2, _zero];
if (isNil "FlakTarget") then {
  _FlakTarget = "Land_HelipadEmpty_F" createVehicle _targetPos;
  _FlakTarget setVehicleVarName "FlakTarget"; FlakTarget = _FlakTarget;
};
_FlakGuns = _firingPos nearEntities [_Flaks, ((triggerArea _firingPos) select 0)];
{_x setAmmo [primaryWeapon _x, 30];
  _x doWatch FlakTarget;
  waitUntil {_x aimedAtTarget [FlakTarget] > 0};
  _x fireAtTarget FlakTarget} forEach _FlakGuns;*/
// If there is flak fire on the plane already, quit the function
_firingPos setVariable ["activeFlak", true];
while {_firingPos getVariable ["activeFlak", false]} do {
  _planes = [];
  {if ((vehicle _x isKindOf "Air") && (alive _x) && !((typeOf vehicle _x) isEqualTo "LIB_US_Parachute") && ((getPosATL _x) select 2) > _minAlt) then {
      _planes pushBackUnique (vehicle _x);
  }} forEach _thisList;
  //Anonymous scheduled function: [Plane object, zeroed altitude, number of AA guns] ==> Spawn flak explosions
  {[_x, _minAlt, _zero, _firingPos, _thisList] spawn {
    params [["_plane", objNull], ["_minAlt", 100], ["_zero", 300], ["_firingPos", objNull], ["_thisList", []]];
    _Flaks = ["fow_w_flak36_camo_ger_heer", "fow_w_flak36_gray_ger_heer", "fow_w_flak36_green_ger_heer", "fow_w_flak36_tan_ger_heer"];
    if (_plane getVariable ["isFlak", false]) exitWith {};
    _plane setVariable ["isFlak", true];
    while {(((getPosATL _plane) select 2) > _minAlt) && (_plane inArea _firingPos)} do {
      _planes = [];
      {if ((vehicle _x isKindOf "Air") && !((typeOf vehicle _x) isEqualTo "LIB_US_Parachute") && ((getPosATL _x) select 2) > _minAlt) then {
          _planes pushBackUnique (vehicle _x);
      }} forEach _thisList;
      _planes = count _planes;
      if (_planes == 0) then {
        _planes = 1;
      };
      _AAs = {(alive _x) && ((alive (commander _x)) || (alive (gunner _x)) || (alive (driver _x)))} count (_firingPos nearEntities [_Flaks, ((triggerArea _firingPos) select 0)]);
      //Shake effect for all the crew of the plane
      if (_AAs == 0) exitWith {};
      {[_plane, _planes, _AAs, _zero] remoteExec ["rmn_fnc_shake", _x select 0]} forEach fullCrew _plane;
      //Spawn n explosions for how many AA guns are in the area
      for "_i" from 1 to _AAs do {
        //Generate random horizontal direction
        _hdir = floor random 359;
        //Generate random vertical direction
        _vdir = floor random 359;
        //Generate a random distance depending on the minimum altitude
        _rdist = random [_zero/4, _zero/3, _zero/2];
        //Calculate the Flak Horizontal Spread
        _dist = (abs (log (((getPosATL _plane) select 2)/_zero))*_rdist) + random [5, 5, 10];
        //Calculate the Flak Vertical Spread
        _h = abs (log (((getPosATL _plane) select 2)/_zero)*(_zero/12));
        //Get position of the plane
        _pos = getPosATL _plane;
        //Set the X position of the explosion
        _pos set [0, (_pos select 0)+(sin(_hdir)*_dist)];
        //Set the Y position of the explosion
        _pos set [1, (_pos select 1)+(cos(_hdir)*_dist)];
        //Set the Z position of the explosion
        _pos set [2, (_pos select 2)+(sin(_vdir)*_h)];
        //Spawn the explosion
        "LIB_61KExplosion" createVehicle _pos;
        //Set delay between explosions based on number of active batteries
        sleep random [0, 2*_planes/_AAs, 8*_planes/_AAs];
      };
    };
    _plane setVariable ["isFlak", false];
    }} forEach _planes;
  sleep 1;
};
_firingPos setVariable ["activeFlak", false];
