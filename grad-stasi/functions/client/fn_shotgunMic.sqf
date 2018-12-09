params ["_unit"];

player setVariable ["GRAD_shotgunMicActive", true];

// debug
private _debugObject = createSimpleObject ["Sign_Sphere10cm_F", position player];



[{
	params ["_args", "_handle"];
	_args params ["_debugObject"];

	if (!(player getVariable ["GRAD_shotgunMicActive", false])) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		_unit setVariable ["TF_fnc_position", nil];
	};

	// max range 150
	private _eyePos = ASLToAGL eyePos player;
	_eyeTargetInRange =  vectorAdd (getCameraViewDirection player vectorMultiply 150);

	private _earDropTarget =  lineIntersectsSurfaces [
		eyePos player, _eyeTargetInRange, player];

	if (count _earDropTarget < 1) then {
		_earDropTarget = _eyeTargetInRange;
	} else {
		_earDropTarget = _earDropTarget select 0;
	};

	_unit setVariable ["TF_fnc_position", _earDropTarget];
	_debugObject setPos _earDropTarget;
	

}, 0, [_debugObject]] call CBA_fnc_addPerFrameHandler;