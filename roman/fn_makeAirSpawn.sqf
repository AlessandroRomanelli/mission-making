params [["_radio", objNull]];

_radio addAction ["<t color='#ffffff'>==== AIR SPAWN ONLY ==============</t>", "", nil, 1.5, false, false, "", "typeOf _this != 'LIB_USA_NCO_PilotM41VmPm1LtColt'", 5, false, ""];
_radio addAction ["<t color='#ffffff'>==== FOR AUTHORIZED PILOTS =======</t>", "", nil, 1.5, false, false, "", "typeOf _this != 'LIB_USA_NCO_PilotM41VmPm1LtColt'", 5, false, ""];
_radio addAction ["<t color='#ffffff'>==== RAF AIR SUPPORT REQUESTS ====</t>", "", nil, 1.5, false, false, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt'", 5, false, ""];
_radio addAction ["<t color='#fff000'>==== SPITFIRE MK. Vb =============</t>", "", nil, 1.5, false, false, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt'", 5, false, ""];
_radio addAction ["<t color='#ffffff'>Green Variant</t>", {["spitfire_v_G_no4", "air_spawn",  300, 250] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#ffffff'>Grey Variant</t>", {["spitfire_v_no4", "air_spawn",  300, 250] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this isEqualto 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#ffffff'>Malta Variant</t>", {["spitfire_v_M_no4", "air_spawn",  300, 250] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this isEqualto 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#ffffff'>Tunisia Variant</t>", {["spitfire_v_D_no4", "air_spawn",  300, 250] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this isEqualto 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#00ff00'>==== FIGHTER PLANES ==============</t>", "", nil, 1.5, false, false, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt'", 5, false, ""];
_radio addAction ["<t color='#ffffff'>P-39 Airacobra</t>", {["LIB_RAF_P39", "air_spawn",  300, 250] spawn rmn_fnc_spawnPlane}, nil, 1.5, true, false, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#ffffff'>Hurricane Mk. IIa (MGs)</t>", {["CSJ_HHmkIIa", "air_spawn",  300, 250] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#ffffff'>Hurricane Mk. IIc (MCs)</t>", {["CSJ_HHmkIIc", "air_spawn",  300, 250] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#00ffff'>==== GROUND ATTACKERS ============</t>", "", nil, 1.5, false, false, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt'", 5, false, ""];
_radio addAction ["<t color='#ffffff'>P-38 Lightning</t>", {["LIB_p38_uk", "air_spawn",  300, 250] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#0099ff'>==== CARGO PLANES ================</t>", "", nil, 1.5, false, false, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt'", 5, false, ""];
_radio addAction ["<t color='#ffffff'>C-47 Skytrain</t>", {["LIB_C47_RAF", "air_spawn",  150, 500] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#ffffff'>Mk.I Hadrian</t>", {["LIB_MKI_HADRIAN", "air_spawn",  150, 1000] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#ffffff'>AS-51 Horsa</t>", {["LIB_HORSA_RAF", "air_spawn",  150, 1000] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#0000ff'>==== BOMBER PLANES ===============</t>", "", nil, 1.5, false, false, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt'", 5, false, ""];
_radio addAction ["<t color='#ffffff'>B-25 Mitchell</t>", {["LIB_b25_uk", "air_spawn",  200, 500] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#ffffff'>B-24 Liberator</t>", {["LIB_b24_uk", "air_spawn",  200, 500] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#ff00ff'>==== RECON PLANES ================</t>", "", nil, 1.5, false, false, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt'", 5, false, ""];
_radio addAction ["<t color='#ffffff'>Gladiator Mk. II</t>", {["LIB_gladiator_uk", "air_spawn",  125, 200] spawn rmn_fnc_spawnPlane}, nil, 1.5, false, true, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt';", 5, false, ""];
_radio addAction ["<t color='#ffffff'>==== END OF HANGAR ===============</t>", "", nil, 1.5, false, false, "", "typeOf _this == 'LIB_USA_NCO_PilotM41VmPm1LtColt'", 5, false, ""];
