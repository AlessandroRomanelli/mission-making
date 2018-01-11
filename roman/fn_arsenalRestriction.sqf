params [["_arsenal", objNull], ["_isDonatorArsenal", false]];

_availableWeapons =   [
                        "LEN_StenMk2S",
                        "LIB_M2_Flamethrower",
                        "LIB_M1928A1_Thompson",
                        "bnae_mk1_virtual",
                        "LIB_M1919A6",
                        "LIB_M2_Tripod"
                      ];
_availableItems =     [ "fow_h_uk_mk2",
                        "fow_h_uk_mk2_net",
                        "fow_h_uk_mk2_net_camo",
                  			"NO4_RAF_Jacket",
                  			"NO4_RAF_BD2",
                  			"NO4_RAF_suit",
                  			"raf_sidecap",
                  			"Raf_Cap",
                        "ACE_LIB_FireCord",
                        "ACE_LIB_LadungPM",
                        "fow_h_us_flight_helmet",
                  			"fow_h_uk_beret_commando"
                       ];
_availableBackpacks = [
			                  "fow_b_uk_p37_radio",
                        "B_LIB_US_Type5",
			                  "B_LIB_SOV_RA_Paradrop",
                        "fow_b_us_m2_mortar_adv_weapon",
                        "fow_b_us_m2_mortar_support",
                        "B_LIB_US_M2Flamethrower"
                      ];
_availableMags =      [
                        "10Rnd_303_Magazine",
                        "LIB_US_TNT_4pound_mag",
                        "LIB_Ladung_Big_MINE_mag",
                        "LIB_Ladung_Small_MINE_mag",
                        "LIB_US_M1A1_ATMINE_mag",
                        "LIB_M3_MINE_mag",
                        "LIB_US_M3_MINE_mag",
                        "LIB_1Rnd_145x114",
                  			"fow_1Rnd_piat_HE",
                  			"fow_1Rnd_piat_HEAT",
                        "fow_1Rnd_60mm_m2_HE",
                        "fow_1Rnd_60mm_m2_ILL",
                        "fow_1Rnd_60mm_m2_SMOKE",
                        "LIB_M2_Flamethrower_Mag",
                        "LIB_30Rnd_45ACP",
                        "LIB_30Rnd_45ACP_t",
                        "LEN_32Rnd_9x19",
                        "LIB_50Rnd_762x63"
                      ];


if (_isDonatorArsenal) then {
  donatorArsenal = _arsenal;
  ["AmmoboxInit", [_arsenal, false, {(getPlayerUID player) in whitelist}]] spawn BIS_fnc_arsenal;
} else {
  ["AmmoboxInit", [_arsenal, false, {true}]] spawn BIS_fnc_arsenal;
};

[ missionNamespace, "arsenalOpened", {
    if ((getPlayerUID player) in whitelist) then {
      [donatorArsenal] spawn rmn_fnc_donatorArsenal;
    };
    if ((typeOf player) isEqualto "LIB_US_second_lieutenant") exitWith {};
    disableSerialization;
    hint format ["%1", _this];
    _display = _this select 0;
    {
        ( _display displayCtrl _x ) ctrlSetText "Disabled";
        ( _display displayCtrl _x ) ctrlSetTextColor [ 1, 0, 0, 0.5 ];
        ( _display displayCtrl _x ) ctrlRemoveAllEventHandlers "buttonclick";
        _display displayAddEventHandler ["KeyDown", "if ((_this select 1) in [19,29]) then {true}"];
    }forEach [ 44146, 44147 ];
}] call BIS_fnc_addScriptedEventHandler;

[ missionNamespace, "arsenalOpened", {
  if ((typeOf player) isEqualto "LIB_US_second_lieutenant") exitWith {};
	disableSerialization;
	_display = _this select 0;
	(_display displayCtrl 44150) ctrlRemoveAllEventHandlers "buttonclick";
	(_display displayCtrl 44150) ctrlEnable false;
  _display displayAddEventHandler ["KeyDown", "if ((_this select 1) in [24,29]) then {true}"];
}] call BIS_fnc_addScriptedEventHandler;


if (!_isDonatorArsenal) then {
  [_arsenal, _availableWeapons] call BIS_fnc_addVirtualWeaponCargo;
  [_arsenal, _availableItems] call BIS_fnc_addVirtualItemCargo;
  [_arsenal, _availableBackpacks] call BIS_fnc_addVirtualBackpackCargo;
  [_arsenal, _availableMags] call BIS_fnc_addVirtualMagazineCargo;
};
