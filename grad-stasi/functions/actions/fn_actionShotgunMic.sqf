// ACTIVATE SHOTGUN MIC
private _shotgunMicOn = ["grad_stasi_shotgunMicOn", "Richtmikrofon AN", "", 
{
   	[_player] call GRAD_stasi_fnc_shotgunMic;
}, 
{
    !(player getVariable ['GRAD_stasi_isStasi', false]) &&
    !(player getVariable ['GRAD_shotgunMicActive', false])
}] call ace_interact_menu_fnc_createAction;

[player, 0, ["ACE_MainActions"], _shotgunMicOn] call ace_interact_menu_fnc_addActionToObject;


// DEACTIVATE SHOTGUN MIC
private _shotgunMicOff = ["grad_stasi_shotgunMicOff", "Richtmikrofon AN", "", 
{
   	player setVariable ['GRAD_shotgunMicActive', false];
}, 
{
    (player getVariable ['GRAD_shotgunMicActive', false])
}] call ace_interact_menu_fnc_createAction;

[player, 0, ["ACE_MainActions"], _shotgunMicOff] call ace_interact_menu_fnc_addActionToObject;