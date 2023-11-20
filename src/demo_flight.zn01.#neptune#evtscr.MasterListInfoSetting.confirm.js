// Replace yourTable with the correct Table name
var mParams = oEvent.getParameters();
var oBinding = MasterList.getBinding("items");
var aSorters = [];
var infoText = "";
var filterText = "";

// Sort with Grouping
if (mParams.groupItem) {
    var sPath = mParams.groupItem.getKey();
    var bDescending = mParams.groupDescending;
    aSorters.push(new sap.ui.model.Sorter(sPath, bDescending, true));
    infoText = "Group by: (" + mParams.groupItem.getText() + ")";
}

// Sorting
if (mParams.sortItem) {
    var sPath = mParams.sortItem.getKey();
    var bDescending = mParams.sortDescending;
    aSorters.push(new sap.ui.model.Sorter(sPath, bDescending, false));

    infoText = infoText + " Sort by: (" + mParams.sortItem.getText() + ")";
}

// Filter
// Attribute Key should consist of FieldName__Operator__ValueLow__ValueHigh
var aFilters = [];
$.each(mParams.filterItems, function(i, oItem) {
    var aSplit = oItem.getKey().split("__");
    var sPath = aSplit[0];
    var sOperator = aSplit[1];
    var sValue1 = aSplit[2];
    var sValue2 = aSplit[3];
    var oFilter = new sap.ui.model.Filter(sPath, sOperator, sValue1, sValue2);
    filterText = filterText + oItem.getText();
    aFilters.push(oFilter);
});

// Apply Sorting/Grouping/Filter
oBinding.sort(aSorters);
oBinding.filter(aFilters);

// Apply InfoText
if (filterText) {
    infoText = infoText + " Filter by: (" + filterText + ")";
}

if (infoText) {
    MasterListToolbar.setVisible(true);
    MasterListText.setText(infoText);
} else {
    MasterListToolbar.setVisible(false);
}
