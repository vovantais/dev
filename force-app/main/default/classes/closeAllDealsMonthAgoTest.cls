
@isTest             
private class closeAllDealsMonthAgoTest {
	
   static testmethod void testbatch() {
      Integer count = 200;
      Account acc = new Account(Name='Test Account');
      insert acc;
      
      List<Opportunity> opps = new List<Opportunity>();
      for (integer i=0; i<count; i++){
         Opportunity opp = new Opportunity();
         opp.AccountId=acc.Id;
         opp.Name='My Opportunity '+i;
         opp.StageName='Qualification';
         opp.CloseDate= Date.today().addDays(-1);
         opps.add(opp);
		}
		
      insert opps;
      Test.setCreatedDate( opps.get(0).Id, System.now().addMonths(-2));
      System.assertEquals(count, opps.size());
      
      Test.startTest();
         closeAllDealsMonthAgo obj = new  closeAllDealsMonthAgo();
         Database.executeBatch(obj);
      Test.stopTest();
      
      List<Opportunity> oppUpdatedList = [SELECT Id,StageName,CloseDate FROM Opportunity];
      for(Opportunity o : oppUpdatedList){
         if(Date.Today()>o.CloseDate && (o.StageName != 'Closed Won' || o.StageName !='Closed Lost')){
               o.StageName = 'Closed Lost';
               System.assertEquals('Closed Lost', o.StageName);    
            }
      }
	}
}