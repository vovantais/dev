global with sharing class schedularCloseAllDealsMonthAgo implements Schedulable{
	
      global void execute(SchedulableContext sc) {  
            closeAllDealsMonthAgo closeDeals = new closeAllDealsMonthAgo(); 
            database.executebatch(closeDeals);
      }
      public static void schedulerMethod(){
            schedularCloseAllDealsMonthAgo sched = new schedularCloseAllDealsMonthAgo();
            string con_exp= '0 0 23 * * ?';
            System.schedule('schedularCloseAllDealsMonthAgo', con_exp, sched);
      }
}