params [["_text", ""], ["_timeLeft", 0], ["_override", false]];
if (!isNil "countdown_spawn" && !_override) exitWith {};

disableSerialization;
_initTime = diag_tickTime;
_endTime = _initTime + (_timeLeft*60);
"countdown" cutRsc ["countdown", "PLAIN"];
_d = uiNamespace getVariable ["countdown", displayNull];

if (_override) then {
  terminate countdown_spawn;
  countdown_spawn = nil;
};

countdown_spawn = [_initTime, _endTime, _d, _text] spawn {
  disableSerialization;
  params [["_initTime", diag_tickTime], ["_endTime", diag_tickTime], ["_d", displayNull], ["_text", ""]];
  while {diag_tickTime < _endTime} do {
    _timeLeft = _endTime - diag_tickTime;
    _displayTime = [_timeLeft] call bis_fnc_secondsToString;
    /* if (diag_tickTime - _initTime < 5) then {
      (_d displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1' color='#FFFFFF' shadow='2' align='center' t font='PuristaMedium'>%1:</t><t size='1.5' color='#FFFFFF' shadow='2' align='center' t font='PuristaMedium'><br/>%2</t>", toUpper _text, _displayTime];
    };
    if (round (diag_tickTime - _initTime) == 3) then {
      "countdown" cutFadeout 0.25;
    }; */

    if ((_timeleft > 305) && (floor (diag_tickTime - _initTime) == 5)) then {
      "countdown" cutFadeout 0.25;
    };
    if (_timeLeft > 1800) then {
      if (((round _timeLeft) % 600) == 5) then {
        "countdown" cutRsc ["countdown", "PLAIN"];
        _d = uiNamespace getVariable ["countdown", displayNull];
      };
      (_d displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1' color='#FFFFFF' shadow='2' align='center' t font='PuristaMedium'>%1:</t><t size='1.5' color='#FFFFFF' shadow='2' align='center' t font='PuristaMedium'><br/>%2</t>", toUpper _text, _displayTime];
      if (((round _timeLeft) % 600) == 595) then {
        "countdown" cutFadeout 0.25;
      };
      sleep 1;
    };
    if ((_timeLeft > 305) && (_timeLeft <= 1800)) then {
      if (((round _timeLeft) % 300) == 5) then {
        "countdown" cutRsc ["countdown", "PLAIN"];
        _d = uiNamespace getVariable ["countdown", displayNull];
      };
      (_d displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1' color='#FFFFFF' shadow='2' align='center' t font='PuristaMedium'>%1:</t><t size='1.5' color='#FFFFFF' shadow='2' align='center' t font='PuristaMedium'><br/>%2</t>", toUpper _text, _displayTime];
      if (((round _timeLeft) % 300) == 295) then {
        "countdown" cutFadeout 0.25;
      };
      sleep 1;
    };
    if ((_timeLeft > 60) && (_timeLeft <= 305)) then {
      if (((round _timeLeft) % 60) == 3) then {
        "countdown" cutRsc ["countdown", "PLAIN"];
        _d = uiNamespace getVariable ["countdown", displayNull];
      };
      (_d displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1' color='#FFFFFF' shadow='2' align='center' t font='PuristaMedium'>%1:</t><t size='1.5' color='#FFFFFF' shadow='2' align='center' t font='PuristaMedium'><br/>%2</t>", toUpper _text, _displayTime];
      if (((round _timeLeft) % 60) == 57) then {
        "countdown" cutFadeout 0.25;
      };
      sleep 1;
    };
    if ((round _timeLeft) == 60) then {
      "countdown" cutRsc ["countdown", "PLAIN"];
      _d = uiNamespace getVariable ["countdown", displayNull];
    };
    if ((_timeLeft > 0) && (_timeLeft <= 60)) then {
      if (_d isEqualTo displayNull) then {
        "countdown" cutRsc ["countdown", "PLAIN"];
        _d = uiNamespace getVariable ["countdown", displayNull];
      };
      if (floor _timeLeft >= 10) then {
        (_d displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1' color='#FFFFFF' shadow='2' align='center' t font='PuristaMedium'>%1:</t><t size='1.5' color='#FFFFFF' shadow='2' align='center' t font='PuristaMedium'><br/>%2</t>", toUpper _text, _displayTime];
      };
      if (floor _timeLeft < 10 && floor _timeLeft >= 5) then {
        (_d displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1' color='#FFBBBB' shadow='2' align='center' t font='PuristaMedium'>%1:</t><t size='1.5' color='#FFBBBB' shadow='2' align='center' t font='PuristaMedium'><br/>%2</t>", toUpper _text, _displayTime];
      };
      if (floor _timeLeft < 5 && floor _timeLeft >= 3) then {
        (_d displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1' color='#FF8888' shadow='2' align='center' t font='PuristaMedium'>%1:</t><t size='1.5' color='#FF8888' shadow='2' align='center' t font='PuristaMedium'><br/>%2</t>", toUpper _text, _displayTime];
      };
      if (floor _timeLeft < 3 && floor _timeLeft >= 1) then {
        (_d displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1' color='#FF4444' shadow='2' align='center' t font='PuristaMedium'>%1:</t><t size='1.5' color='#FF4444' shadow='2' align='center' t font='PuristaMedium'><br/>%2</t>", toUpper _text, _displayTime];
      };
      if (floor _timeLeft < 1) then {
        (_d displayCtrl 1100) ctrlSetStructuredText parseText format ["<t size='1' color='#FF0000' shadow='2' align='center' t font='PuristaMedium'>%1:</t><t size='1.5' color='#FF0000' shadow='2' align='center' t font='PuristaMedium'><br/>%2</t>", toUpper _text, _displayTime];
      };
      sleep 1;
    };
  };
  sleep 2;
  "countdown" cutFadeout 0.5;
  countdown_spawn = nil;
};
