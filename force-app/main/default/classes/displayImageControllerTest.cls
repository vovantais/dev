@isTest
public class displayImageControllerTest {

	private static testMethod void testCreate() {

      Account acct = new Account(Name='TEST');
      insert acct;

      ContentVersion contentVersion = new ContentVersion(
         Title = 'Penguins',
         PathOnClient = 'Penguins.jpg',
         VersionData = Blob.valueOf('Test Content'),
         IsMajorVersion = true
		);
		
      insert contentVersion;    
      List<ContentDocument> documents = [SELECT Id, Title, LatestPublishedVersionId FROM ContentDocument];

      ContentDocumentLink cdl = New ContentDocumentLink();
      cdl.LinkedEntityId = acct.id;
      cdl.ContentDocumentId = documents[0].Id;
      cdl.shareType = 'V';
      insert cdl;

      Test.startTest();
      	displayImageController.getImage(acct.Id);
      Test.stopTest();
   }
}
