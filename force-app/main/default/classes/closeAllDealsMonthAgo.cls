global class closeAllDealsMonthAgo implements 
   Database.Batchable<SObject>, Database.Stateful{ 

   List<Opportunity> listRecords = new List<Opportunity>();
   global Database.QueryLocator start(Database.BatchableContext BC){
         String query = 'Select Id, Name, CloseDate,createdDate,StageName From Opportunity WHERE CloseDate=THIS_MONTH';
         return Database.getQueryLocator(query);
   }
   global void execute(Database.BatchableContext BC, List<SObject> scope){
      for(Opportunity obj : (Opportunity[]) scope){  
         if(Date.Today()>obj.CloseDate && (obj.StageName != 'Closed Won' || obj.StageName !='Closed Lost')){
            obj.StageName = 'Closed Lost';
            listRecords.add(obj);
         }
         if(Date.Today()>obj.createdDate.addMonths(1) && (obj.StageName != 'Closed Won' || obj.StageName !='Closed Lost')){
            obj.StageName = 'Closed Lost';
            obj.CloseDate= Date.today();
            listRecords.add(obj);
         }
      }
   }
   global void finish(Database.BatchableContext BC){
      if(!listRecords.isEmpty()){
         update listRecords;
      }
   }      
}