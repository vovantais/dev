@isTest
public class changeFieldProductTest {

   @isTest static void changeFieldProductTest(){
      Account acc = new Account(Name = 'Test Account');
		insert acc;
		
      Opportunity opp = new opportunity(Name='Test Account Opp' ,  AccountId= acc.Id, StageName = 'Prospecting', CloseDate = Date.today() + 30);
      insert opp;
      
      Id pricebookId = Test.getStandardPricebookId();

      Product2 prod = new Product2(
         Name = 'Test product',
         ProductCode = '795423',
         IsActive__c = true
      );
      insert prod;
      
      PricebookEntry pbEntry = new PricebookEntry(
         Pricebook2Id = pricebookId,
         Product2Id = prod.Id,
         UnitPrice = 500.00,
         IsActive = true
      );
      insert pbEntry;
      
      OpportunityLineItem oli = new OpportunityLineItem(
         OpportunityId = opp.Id,
         Quantity = 1,
         PricebookEntryId = pbEntry.Id,
         TotalPrice = 1 * pbEntry.UnitPrice,
         Product2Id = prod.Id
      );
      insert oli;
      
      Test.startTest();
			prod.IsActive__c = false;
			update prod;
      Test.stopTest();
   }
}