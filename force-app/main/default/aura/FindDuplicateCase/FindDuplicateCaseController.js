({
	doInit: function(component, event, helper) {
      let action = component.get('c.getCaseListDuplicate');
      let recordId = component.get("v.recordId"); 
      action.setParams({"caseRecordID": recordId});
      action.setCallback(this, function(response){
         if(response.getState() == 'SUCCESS'){
            if(response.getReturnValue().length>0){
                  component.set("v.content",true)
                  component.set("v.duplicateCaseList", response.getReturnValue());
                  component.set("v.getval",response.getReturnValue());
               }else{
                  component.set("v.content",false)
               }
               
            } else {
               	console.log('::Some error occurred::');
            }
		});

      $A.enqueueAction(action);
	},

   selectedRecords : function(component, event, helper) {
      let res = component.get("v.getval");
      let openModel = component.get("v.isOpen");
      helper.mergeRecords(component, event, helper,res,openModel);
   },
   closeModel: function(component, event, helper) {
      component.set("v.isOpen", false);
   },
})