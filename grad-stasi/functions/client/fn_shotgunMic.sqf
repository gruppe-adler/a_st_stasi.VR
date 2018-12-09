params ["_unit"];

player setVariable ["GRAD_shotgunMicActive", true];

// debug
private _debugObject = createSimpleObject ["Sign_Sphere10cm_F", AGLtoASL (position player)];



[{
	params ["_args", "_handle"];
	_args params ["_debugObject"];

	if (!(player getVariable ["GRAD_shotgunMicActive", false])) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		_unit setVariable ["TF_fnc_position", nil];
		deleteVehicle _debugObject;

		// reset volume
		player setVariable ["tf_globalVolume", 1];
	};

	// max range 150
	private _humanEye = positionCameraToWorld [0,0,0];
	private _aimVector = ((getCameraViewDirection player) vectorMultiply 150);
	private _eyeTargetInRange = _humanEye vectorAdd _aimVector;



	private _earDropTarget =  lineIntersectsSurfaces [
		eyePos player, _eyeTargetInRange, player];

	if (count _earDropTarget < 1) then {
		_earDropTarget = _eyeTargetInRange;
		systemChat "out of range, limiting distance to 50";
	} else {
		_earDropTarget = ASLtoAGL (_earDropTarget select 0 select 0);
	};

	// reduce volume with distance
	player setVariable ["tf_globalVolume", 1-(player distance _earDropTarget/150)];

	systemChat str _earDropTarget;

	private _fakePosition = [_earDropTarget, (positionCameraToWorld [0,0,1]) vectorDiff _earDropTarget];
	player setVariable ["TF_fnc_fakePosition", _fakePosition];
	player setVariable ["TF_fnc_position", {player getVariable ["TF_fnc_fakePosition", nil]}];
	_debugObject setPos _earDropTarget;
	

}, 0, [_debugObject]] call CBA_fnc_addPerFrameHandler;