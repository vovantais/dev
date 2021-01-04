trigger changeFieldProduct on Product2 (after insert,after update) {
   
   List<Task> taskList = new List<Task>();
	Set<Id> prodIds = new Set<Id>();
	
   for(Product2 prod: Trigger.New){
      if(prod.IsActive__c == false){
				prodIds.add(prod.id);
      }
   }
   if(!prodIds.IsEmpty()){
         List<OpportunityLineItem> obj = [SELECT OpportunityId,Opportunity.Account.Phone, Product2Id FROM OpportunityLineItem WHERE Product2Id IN :prodIds];
            for(OpportunityLineItem  opp :obj){
               taskList.add(
							new Task(
								RecordType__c ='Call',
								Subject='Old model deal!!!',
								whatId = opp.OpportunityId,
								Status='New',
								Auto_Created__c=true,
								ActivityDate = date.today().addMonths(1),
								Phone__c = opp.Opportunity.Account.Phone,
								Priority = 'High'
							));
            }
      }
   if(taskList.size()>0){
      insert taskList;
   }
}