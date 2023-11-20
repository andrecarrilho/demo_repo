// Get Selected Row of MasterList
var selectedItem = this.getSelectedItem();
var context = selectedItem.getBindingContext();

// Get key value
var key = context.getProperty("KEY");

modeloPageDetail.setData(context.getObject());

sap.ui.core.BusyIndicator.show();
getOnlineDetail(key);
oApp.toDetail(oPageDetail);  // Navigate
