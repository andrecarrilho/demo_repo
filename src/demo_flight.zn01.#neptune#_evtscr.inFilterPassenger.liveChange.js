var binding = tabBooking.getBinding("items");
var filter = new sap.ui.model.Filter("PASSNAME", "Contains", this.getValue());
binding.filter([filter]);
