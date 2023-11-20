// Filter List by Airline Id
var binding = MasterList.getBinding("items");

if (modelMasterForm.oData.CARR_ID !== '') {
    var filter = new sap.ui.model.Filter("AIRLINEID", "EQ", modelMasterForm.oData.CARR_ID);
} else {
    var filter = new sap.ui.model.Filter("AIRLINEID", "NE", '');
}
binding.filter([filter]);

var item_qty = binding.getLength();

//Update Header Counter Text
txtTitleMaster.setText(txtTranslateHeader.getText() + " (" + item_qty + ")");

//If no items, show Message page
if (item_qty === 0) {
    oApp.toDetail(oPageMessage);
} else {
    selectFirstItem();
}
