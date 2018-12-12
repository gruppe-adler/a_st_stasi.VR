class GRAD_stasi {

    class client_actions {
        file = grad-stasi\functions\client;

        class actions { postInit = 1;};
        class addTrackerToVehicle;
        class checkVehicleForTracker;
        class checkVehicleResult;
        class initValues { preInit = 1; };
        class removeTrackerFromVehicle;
        class shotgunMic;
    };
    
};