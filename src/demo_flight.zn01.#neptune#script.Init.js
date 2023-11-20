// Globals
var bGrouped = false;

oMessageStrip.setVisible(false);

// InitLoad
if (sap.n) {
    sap.n.Shell.attachInit(function(data, navObj) { // App launch
        console.log("Flight Launchpad Init...");
    });

    sap.n.Shell.attachBeforeDisplay(function(data, navObj) { // App display
        console.log("Flight Launchpad BeforeDisplay...");
    });

} else {
    sap.ui.getCore().attachInit(function(data) {
        console.log("Flight Standalone Init...");

        setTimeout(function() {

            inFilterMaster.rerender();
            pullUpdate.setVisible(sap.ui.Device.support.touch);

            $(document).ajaxComplete(function() {
                sap.ui.core.BusyIndicator.hide();
            });

        }, 200);
    });
}
