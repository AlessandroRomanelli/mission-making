params [["_plane", objNull], ["_planes", 1], ["_AAs", 1], ["_zero", 300]];
_dist = abs (log (((getPosATL _plane) select 2)/_zero))*_zero/3;
  _amount = 17 - (2*atan(((_dist-25)*pi)/2880));
enableCamShake true;
addCamShake [_amount, 2*_planes, 75];
