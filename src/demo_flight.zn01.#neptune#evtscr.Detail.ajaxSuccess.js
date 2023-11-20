// Set tab counter
barDetailBookings.setCount(modeltabBooking.oData.length);

if (modelformAvailability.oData.ECONOFREE === 0) {
    oMessageStrip.setType("Error");
    oMessageStrip.setText(txtTranslateNoEconAvail.getText());
} else if (modelformAvailability.oData.BUSINFREE === 0) {
    oMessageStrip.setType("Warning");
    oMessageStrip.setText(txtTranslateNoBusiAvail.getText());
} else if (modelformAvailability.oData.FIRSTFREE === 0) {
    oMessageStrip.setType("Warning");
    oMessageStrip.setText(txtTranslateNoFirstAvail.getText());
} else {
    oMessageStrip.setType("Success");
    oMessageStrip.setText(txtTranslateSeatsAvail.getText());
}

oMessageStrip.setVisible(true);
sap.ui.core.BusyIndicator.hide();
