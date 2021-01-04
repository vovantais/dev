({
	doInit: function(component, event, helper) { 
      let action = component.get('c.getRates');
      action.setCallback(this, function(response){
      if(response.getState() == 'SUCCESS'){    
            component.set("v.result", response.getReturnValue());
      } else {
         console.log('::Some error occurred::');
      }
		});
      $A.enqueueAction(action);
	},
	
   changeSelect: function (component, event, helper) {
      const elem = component.find('list');
      const textVal= elem.get("v.value");   
      component.find("cursInfo").set("v.value",textVal);
   }
})