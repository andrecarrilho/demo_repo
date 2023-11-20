function setHeaderText() {
    if (typeof modelMasterList.oData.length !== 'undefined') {
        txtTitleMaster.setText(txtTranslateHeader.getText() + " (" + modelMasterList.oData.length + ")");
    } else {
        txtTitleMaster.setText(txtTranslateHeader.getText());
    }
}

function selectFirstItem() {

    // Not for phone
    if (sap.ui.Device.system.phone) {
        return;
    }

    // Not when grouping is active
    if (MasterListToolbar.getVisible()) {
        return;
    }

    var items = MasterList.getItems();
    MasterList.removeSelections();

    if (items.length > 0) {
        MasterList.setSelectedItem(items[0]);
        MasterList.fireItemPress();
    }
}

function afterDataLoadedAjax() {

    sap.ui.core.BusyIndicator.hide();

    pullUpdate.hide();
    jQuery.sap.require("sap.m.MessageToast");
    sap.m.MessageToast.show(txtTranslateUpdated.getText());

    setHeaderText();

    if (modelMasterList.oData.length === 0){
       OpenoMessageGenData();

    } else{
       selectFirstItem();
    }
}
