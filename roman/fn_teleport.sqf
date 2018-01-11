params [["_dest", objNull]];

// Get a random direction
_dir = random 359;
_pos = getPosWorld _dest;
_rdist = random 2;
// Move the person 15 meters away from the destination (in the direction of _dir)
_pos set [0, (_pos select 0)+sin(_dir)*_rdist];
_pos set [1, (_pos select 1)+cos(_dir)*_rdist];
player setPosWorld _pos;
player setDir (getDir _dest);
