_skeet = param [0, objNull, [objNull]];
_launcher = param [1, objNull, [objNull]];
_vel = velocity _launcher;
_dir = direction _launcher + random [-2.5, 0, 2.5] + 180;
_speed = random [10, 12.5, 15];
_hspeed = random [8, 10, 12];
_skeet setVelocity [
 (_vel select 0) + (sin _dir * _speed),
 (_vel select 1) + (cos _dir * _speed),
 _hspeed
];
_skeet addEventHandler ["Killed", {
  ["HIT!"] remoteExec ["hint", 0];
}];
sleep 5;
deleteVehicle _skeet;
