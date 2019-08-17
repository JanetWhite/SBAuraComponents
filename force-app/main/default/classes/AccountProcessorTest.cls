@IsTest
private class AccountProcessorTest {
  @isTest
  private static void testAccProcessor() {
    Test.setMock(HttpCalloutMock.class, new AccountProcessorMock());
      List<Account> accList = new List<Account>();
      List<Id> accIds = new List<Id>();
      List<Contact> conList = new List<Contact>();
      for(integer i=0; i<5;i++){
          Account a = new Account(name='test ' + i);
          accList.add(a);
      }
      insert accList;
      
      for(integer i=0; i<5;i++){
          for(integer j=0; j<i; j++){
              system.debug('i = ' + i + 'j = ' + j);
      		Contact c = new Contact(lastname='test ',firstname = 'first ' + i, AccountId=accList[i].Id);
          	conList.add(c);
          }
          accIds.add(accList[i].Id);
      }
      insert conList;
      
    Test.startTest();
      AccountProcessor.countContacts(accIds);
    Test.stopTest();
    // runs callout and check results
    accList = [select id, Number_of_Contacts__c from Account where Id =: accIds ];
    System.assertEquals(0, accList[0].Number_of_Contacts__c);
      System.assertEquals(4, accList[4].Number_of_Contacts__c);
  }
}