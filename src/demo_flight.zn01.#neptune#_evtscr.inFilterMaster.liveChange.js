var binding = MasterList.getBinding("items");
var filter = new sap.ui.model.Filter("INTRO", "Contains", this.getValue());
binding.filter([filter]);
