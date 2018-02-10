_radar = param [0, objNull, [objNull]];

_radar setVariable ["status", 0];
_radar setVariable ["inUse", false];

[
  _radar,
  "Pry Open Electrical Box",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",
  "(cursorObject distance _this) < 4 && !(_target getVariable ['inUse', false]) && ((_target getVariable ['status', 0]) == 0)",
  "(_this getVariable ['itemEquip', '']) isEqualTo 'crowbar'",
  {(_this select 0) setVariable ["inUse", true, true]; (_this select 0) setVariable ["inUse", false, false]},
  {},
  {hint 'The Electrical Box was cracked open!'; (_this select 0) setVariable ["status", 1, true]; (_this select 0) setVariable ["inUse", false, true]},
  {hint "Something went wrong! \n You need something to pry this open!"; (_this select 0) setVariable ["inUse", false, true]},
  nil,
  20,
  0,
  true,
  false
] call bis_fnc_holdActionAdd;

[
  _radar,
  "Disconnect Current (HIGH VOLTAGE)",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa",
  "(cursorObject distance _this) < 4 && !(_target getVariable ['inUse', false]) && ((_target getVariable ['status', 1]) == 1)",
  "(_this getVariable ['itemEquip', '']) isEqualTo 'electrical_kit'",
  {(_this select 0) setVariable ["inUse", true, true]; (_this select 0) setVariable ["inUse", false, false]},
  {},
  {hint 'The Electrical Box is now offline!'; (_this select 0) setVariable ["status", 2, true]; (_this select 0) setVariable ["inUse", false, true]},
  {hint "ELECTROCUTED!"; playSound "shock"; (_this select 1) setDamage 1; (_this select 0) setVariable ["inUse", false, true]},
  nil,
  45,
  0,
  true,
  false
] call bis_fnc_holdActionAdd;

[
  _radar,
  "Cut the wirings",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
  "(cursorObject distance _this) < 4 && !(_target getVariable ['inUse', false]) && ((_target getVariable ['status', 2]) == 2)",
  "true",
  {(_this select 0) setVariable ["inUse", true, true]; (_this select 0) setVariable ["inUse", false, false]},
  {},
  {hint 'All the electrical wiring has been cut'; (_this select 0) setVariable ["status", 3, true]; (_this select 0) setVariable ["inUse", false, true]},
  {hint "Something went wrong! \n You need some wire cutters"; (_this select 0) setVariable ["inUse", false, true]},
  nil,
  60,
  0,
  true,
  false
] call bis_fnc_holdActionAdd;

[
  _radar,
  "Steal Radar Internals",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",
  "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",
  "(cursorObject distance _this) < 4 && !(_target getVariable ['inUse', false]) && ((_target getVariable ['status', 3]) == 3)",
  "true",
  {(_this select 0) setVariable ["inUse", true, true]; (_this select 0) setVariable ["inUse", false, false]},
  {},
  {hint 'Some components have been removed from the radar, bring them to safety!'; (_this select 0) setVariable ["inUse", false, true]; _crate = 'Box_LEN_Wps_F' createVehicle (getPos (_this select 1)); clearItemCargoGlobal _crate; clearWeaponCargoGlobal _crate; clearMagazineCargoGlobal _crate; clearBackpackCargoGlobal _crate;},
  {hint "Something went wrong, try again!"; (_this select 0) setVariable ["inUse", false, true]},
  nil,
  30,
  0,
  false,
  false
] call bis_fnc_holdActionAdd;

while {(_radar getVariable ["status", 0]) < 2} do {
  _radar say3D "voltage";
  sleep 2.8;
};

_radar say3D "powerdown";

/* [_target,_title,_condShow,_condProgress,_codeStart,_codeProgress,_codeCompleted,_codeInterrupted,_arguments,_duration,_priority,_removeCompleted] call bis_fnc_holdActionAdd; */
