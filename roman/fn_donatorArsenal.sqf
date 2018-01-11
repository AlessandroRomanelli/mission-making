_arsenal = param [0, objNull, [objNull]];

_weps =               ["LEN_StenMk2S"];
_items =              [ "fow_h_uk_mk2",
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
                  			"fow_h_uk_beret_commando"];

_backpacks =          [ "fow_b_uk_p37_radio",
                        "B_LIB_US_Type5",
			                  "B_LIB_SOV_RA_Paradrop"];
_mags =               [ "LIB_US_TNT_4pound_mag",
                        "LIB_Ladung_Big_MINE_mag",
                        "LIB_Ladung_Small_MINE_mag",
                        "LIB_US_M1A1_ATMINE_mag",
                        "LIB_M3_MINE_mag",
                        "LIB_US_M3_MINE_mag",
                        "LIB_1Rnd_145x114",
                  			"fow_1Rnd_piat_HE",
                  			"fow_1Rnd_piat_HEAT"];

_veteransItems =      [ "fow_v_uk_para_base",
                        "fow_v_uk_para_bren",
                        "fow_v_uk_para_sten"];

_goldItems      =     [ "fow_g_glasses1",
                        "fow_g_glasses2",
                        "fow_g_glasses3",
                        "fow_g_glasses4",
                        "fow_g_gloves1",
                        "fow_g_gloves2",
                        "fow_g_gloves3",
                        "fow_g_gloves4",
                        "fow_g_gloves5",
                        "fow_g_gloves6",
                        "G_LIB_Scarf_G",
                        "G_LIB_Scarf_G",
                        "G_LIB_Scarf2_B",
                        "G_LIB_Scarf2_G",
                        "G_LIB_GER_Gloves1",
                        "G_LIB_GER_Gloves2",
                        "G_LIB_GER_Gloves3",
                        "G_LIB_GER_Gloves4",
                        "LIB_GER_Gloves1",
                        "LIB_GER_Gloves2",
                        "LIB_GER_Gloves3",
                        "LIB_GER_Gloves4",
                        "G_LIB_Dienst_Brille2",
                        "G_LIB_Dienst_Brille",
                        "G_LIB_Watch2",
                        "G_LIB_Watch",
                        "G_LIB_Headwrap",
                        "G_LIB_Headwrap_gloves",
                        "LIB_GER_Headset",
                        "G_LIB_Binoculars"];

_goldBackpacks      = [ "fow_b_uk_bergenpack",
		                    "fow_b_uk_bergenpack_desert",
                        "fow_b_uk_p37_shovel",
                        "fow_b_uk_p37_blanco_shovel"];

_bronzeWeapons =      ["fow_w_webley"];
_bronzeMags    =      ["fow_6Rnd_455"];
_silverWeapons =      ["LIB_M1928A1_Thompson", "LIB_M1928A1_Thompson", "fow_w_m1903A1", "fow_w_m1918a2"];
_silverMags    =      ["LIB_30Rnd_45ACP", "LIB_50Rnd_45ACP", "fow_5Rnd_762x63", "fow_20Rnd_762x63"];
_goldWeapons   =      ["fow_w_leeenfield_no5mk1_junglecarbine", "LEN_M3a1", "fow_w_m1918a2_bak"];
_goldMags      =      ["fow_10Rnd_303", "LEN_30Rnd_45ACP_M3"];

[_arsenal, true, false] call BIS_fnc_removeVirtualBackpackCargo;
[_arsenal, true, false] call BIS_fnc_removeVirtualItemCargo;
[_arsenal, true, false] call BIS_fnc_removeVirtualWeaponCargo;
[_arsenal, true, false] call BIS_fnc_removeVirtualMagazineCargo;
[_arsenal, _weps, _mags, _backpacks, _items] call {
  params ["_arsenal", "_weps", "_mags", "_backpacks", "_items"];
  if ((getPlayerUID player) in admins) then {
  [_arsenal, true, false, true] call BIS_fnc_addVirtualWeaponCargo;
  [_arsenal, true, false, true] call BIS_fnc_addVirtualItemCargo;
  [_arsenal, true, false, true] call BIS_fnc_addVirtualBackpackCargo;
  [_arsenal, true, false, true] call BIS_fnc_addVirtualMagazineCargo;
} else {
  if ((getPlayerUID player) in veterans) then {
    _weps     = _weps + _bronzeWeapons + _silverWeapons + _goldWeapons;
    _mags     = _mags + _bronzeMags + _silverMags + _goldMags;
  } else {
    if ((getPlayerUID player) in bronze) then {
        _weps = _weps + _bronzeWeapons;
        _mags = _mags + _bronzeMags;
    } else {
      if ((getPlayerUID player) in silver) then {
        _weps = _weps + _bronzeWeapons + _silverWeapons;
        _mags = _mags + _bronzeMags + _silverMags;
      } else {
        if ((getPlayerUID player) in gold) then {
            _weps = _weps + _bronzeWeapons + _silverWeapons + _goldWeapons;
            _mags = _mags + _bronzeMags + _silverMags + _goldMags;
            _items = _items + _goldItems;
            _backpacks = _backpacks + _goldBackpacks;
        } else {};
      };
    };
  };
};

  [_arsenal, _weps] call BIS_fnc_addVirtualWeaponCargo;
  [_arsenal, _items] call BIS_fnc_addVirtualItemCargo;
  [_arsenal, _backpacks] call BIS_fnc_addVirtualBackpackCargo;
  [_arsenal, _mags] call BIS_fnc_addVirtualMagazineCargo;
};

true
