params ["_vehicle", "_chanceForSuccess", "_isRevealed"];

private _hasTracker = _vehicle getVariable ["GRAD_stasi_trackerAttached", false];

if (random 1 < _chanceForSuccess && _hasTracker || _isRevealed) then {

	private _result = ["Found a tracker. Do you want to destroy it?", "Destroy", "Dont destroy", true] call BIS_fnc_guiMessage; 
	
	if (_result) then {
		_vehicle setVariable ["GRAD_stasi_trackerAttached", false, true];
		_vehicle setVariable ["GRAD_stasi_trackerRevealed", false, true];
	} else {
		_vehicle setVariable ["GRAD_stasi_trackerRevealed", true, true];
	};

} else {
	
	["Finished search. No tracker found.", "OK", false] call BIS_fnc_guiMessage; 
	
};