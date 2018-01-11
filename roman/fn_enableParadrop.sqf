params [["_plane", objNull]];

if (_plane getVariable ["paradropAvailable", 0] > 0) then {
  _plane addAction ["Paradrop -- Weapon Box", {[0, _this select 0] spawn rmn_fnc_spawnParadrop}, nil, 1.5, true, false, "", "true", 15, false, ""];
  _plane addAction ["Paradrop -- Ammo Box", {[1, _this select 0] spawn rmn_fnc_spawnParadrop}, nil, 1.5, true, false, "", "true", 15, false, ""];
  _plane addAction ["Paradrop -- Explosives Box", {[2, _this select 0] spawn rmn_fnc_spawnParadrop}, nil, 1.5, true, false, "", "true", 15, false, ""];
  _plane addAction ["Paradrop -- Medical Box", {[3, _this select 0] spawn rmn_fnc_spawnParadrop}, nil, 1.5, true, false, "", "true", 15, false, ""];
};
