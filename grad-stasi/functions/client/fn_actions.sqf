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
         [] call GRAD_stasi_fnc_shotgunMic;
    },
    [],1.5,true,true,"",
    "!(player getVariable ['GRAD_shotgunMicActive', false])"
];