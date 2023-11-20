// Group by Booking Date
var oSorter = new sap.ui.model.Sorter("ORDER_DATE", false, !bGrouped);
var binding = tabBooking.getBinding("items");
binding.sort(oSorter);
bGrouped = !bGrouped;
