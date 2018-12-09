
if (!(player getVariable ["GRAD_stasi_isStasi", false])) exitWith {

	// tracker on vehicle
	player addAction [
	    "Check Vehicle for strange Devices",
	    {
	    	params ["_target", "_caller", "_actionId", "_arguments"];
	        [_target] call GRAD_stasi_fnc_checkVehicleForTracker;
	    },
	    [],1.5,true,true,"",
	    "!(player getVariable ['GRAD_stasi_isStasi', false])"
	];
};

// define tracker count
player setVariable ['GRAD_stasi_trackerCount', 1];


// shotgun mic
player addAction [
    "Richtmikrofon AUS",
    {
         player setVariable ['GRAD_shotgunMicActive', false];
    },
    [],1.5,true,true,"",
    "player getVariable ['GRAD_shotgunMicActive', false]"
];

player addAction [
    "Richtmikrofon AN",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [_caller] call GRAD_stasi_fnc_shotgunMic;
    },
    [],1.5,true,true,"",
    "!(player getVariable ['GRAD_shotgunMicActive', false])"
];



// tracking device
{
    _x addAction [
        "Add tracking device to vehicle",
        {
        	params ["_target", "_caller", "_actionId", "_arguments"];
            [_target, _caller] call GRAD_stasi_fnc_addTrackerToVehicle;
        },
        [],1.5,true,true,"",
        "player getVariable ['GRAD_stasi_isStasi', false] && {
        	player getVariable ['GRAD_stasi_trackerCount', 0] > 0
    	}"
    ];
} forEach vehicles;

{
    _x addAction [
        "Remove tracking device from vehicle",
        {
        	params ["_target", "_caller", "_actionId", "_arguments"];
        	[_target, _caller] call GRAD_stasi_fnc_removeTrackerFromVehicle;
        },
        [],1.5,true,true,"",
        "player getVariable ['GRAD_stasi_isStasi', false] && {
        	player getVariable ['GRAD_stasi_trackerCount', 0] == 0 &&
        	_target getVariable ['GRAD_stasi_trackerAttached', false]
    	}"
    ];
} forEach vehicles;