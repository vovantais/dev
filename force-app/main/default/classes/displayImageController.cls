public class displayImageController {

   @AuraEnabled  
   public static List<String> getImage(Id CurrentId){
      List<String> files =new List<String>();
      List<ContentDocumentLink> cdLinks =[SELECT Id,ContentDocument.LatestPublishedVersionID,ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId=:CurrentId];
      for(ContentDocumentLink cdl: cdLinks){
         String FileExtension =[SELECT FileExtension FROM ContentVersion WHERE ContentDocumentId=:cdl.ContentDocumentId].get(0).FileExtension;
         if(Pattern.matches('(png|jpg|jpeg|gif|svg)', FileExtension)){
            files.add(URL.getSalesforceBaseUrl().toExternalForm() +'/sfc/servlet.shepherd/version/download/'+cdl.ContentDocument.LatestPublishedVersionID);  
         }
      }
      return files;
   }
}