({
	doInit: function(component, event, helper) { 
      let recordId = component.get("v.recordId");
      let action = component.get('c.getImage');
      action.setParams({"CurrentId": recordId});
      action.setCallback(this, function(response){
         if(response.getState() == 'SUCCESS'){    
            component.set("v.files", response.getReturnValue());
         } else {
            console.log('::Some error occurred::');
         }
		});
      $A.enqueueAction(action);
   },
})