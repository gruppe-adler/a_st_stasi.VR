params ["_vehicle"];

// item must be close to drastically increase chance to find tracker
private _workShopClass = "Land_WeldingTrolley_01_F";

// 10% chance to find tracker without workshop, 70% chance to find with workshop
private _chanceForSuccess = if (isNull (nearestObject [position player, _workShopClass])) then {
	0.1	
} else {
	0.7
};


// if tracker was already found but player decided to let it stick, next search is shorter
private _isRevealed = _vehicle getVariable ["GRAD_stasi_trackerRevealed", false];
private _timeToSearch = if (_isRevealed) then { 5 } else { 60 };


// progressbar
[_timeToSearch, [_vehicle, _chanceForSuccess], {
	_this params ["_args"];
	_args params ["_vehicle", "_chanceForSuccess"];

	[_vehicle, _chanceForSuccess, _isRevealed] call GRAD_stasi_fnc_checkVehicleResult;

}, {
	hint "Aborted checking Vehicle";
}, 
	"Checking Vehicle for Tracking Devices", 
	{true}, 
	["isNotSwimming", "isNotInside", "notOnMap", "isNotSitting"]
] call ace_common_fnc_progressBar;
