_launcher = param [0, objNull, [objNull]];
_launcher enableSimulation false;
_launcher addAction ["Fire a single skeet", {[_this select 0, 0] spawn rmn_fnc_skeetProgram}];
_launcher addAction ["Fire two skeets", {[_this select 0, 1] spawn rmn_fnc_skeetProgram}];
_launcher addAction ["PROGRAMS ==========", {}];
_launcher addAction ["5 Skeets, 10s", {[_this select 0, 1] spawn rmn_fnc_skeetProgram}];
_launcher addAction ["10 Skeets, 20s", {[_this select 0, 1] spawn rmn_fnc_skeetProgram}];
_launcher addAction ["5 Skeets, 5s", {[_this select 0, 1] spawn rmn_fnc_skeetProgram}];
_launcher addAction ["10 Skeets, 10s", {[_this select 0, 1] spawn rmn_fnc_skeetProgram}];
