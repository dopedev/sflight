sap.ui.define(['sap/ui/core/mvc/ControllerExtension',"sap/ui/model/json/JSONModel",     "sap/m/MessageToast"], function (ControllerExtension, JSONModel, MessageToast) {
	'use strict';

	return ControllerExtension.extend('sap.fe.cap.travel.fpm.ext.controller.ObjectPageControllerExtension', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		
		override: {
			/**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf sap.fe.cap.travel.fpm.ext.controller.ObjectPageControllerExtension
             */
			onInit: function () {
				// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
			//	var oModel = this.base.getExtensionAPI().getModel();
				this.getView().setModel(new JSONModel({
					prop: "From JSONModel"
				}),"userdefinedModel");
				this.base.getAppComponent().getRouter().attachRouteMatched(this.onRouteMatched.bind(this))
			}
			
		},
		onRouteMatched: function(){
			MessageToast.show("Route matched invoked.");
		}
	});
});
