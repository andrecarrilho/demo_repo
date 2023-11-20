// Back button handler
function onBackButtonCustom() {

    if (sap.ui.Device.system.phone) {

        switch (oApp.getCurrentPage().getId()) {

            case "oPageMaster":
                AppCache.Back();
                break;

            default:
                oApp.backDetail();
        }
    } else {
        AppCache.Back();
    }

}

// Going offline event
function onOfflineCustom() {

}

// Going online event
function onOnlineCustom() {

}

// On pause event
function onPauseCustom() {

}

// On resume event
function onResumeCustom() {

}
