
public class FindDuplicateCase {

@AuraEnabled
   public static List<Case> getCaseListDuplicate(Id caseRecordID){

      List<Case> caseFields =[SELECT Id,CaseNumber,Origin,Subject,SuppliedEmail,Status,Reason,OwnerId,Description,Country__c,SuppliedName__c,Priority,Account.Name
										FROM Case WHERE Status!='Closed' AND Id=:caseRecordID ];
										
      List<Case> allCasesWithoutCaseFields =[SELECT Id,CaseNumber,Origin,Subject,SuppliedEmail,Status,Reason,OwnerId,Description,Country__c,SuppliedName__c,Priority,
                                             ParentId FROM Case WHERE Status!='Closed' 
                                             AND Id !=:caseRecordID 
                                             AND ParentId =:caseRecordID 
                                             AND Subject=:caseFields[0].Subject 
                                             AND SuppliedEmail=:caseFields[0].SuppliedEmail 
															AND Reason=:caseFields[0].Reason];
															
   List<Case> duplicateCaseList = new List<Case>();
      for(Case c:allCasesWithoutCaseFields){        
				duplicateCaseList.add(c);     
      }
      return duplicateCaseList;  
	}
}
