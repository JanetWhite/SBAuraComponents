@isTest
public class AddPrimaryContactTest {
    
	
    @isTest
    private static void testContactAdd(){
        List<Account> accList = new List<Account>();
    	for(Integer i=0; i<50; i++){
        account nyAcc = new Account(name='testNY'+i, BillingState= 'NY');
        account caAcc = new Account(name='testNY'+i, BillingState= 'CA');
        accList.add(nyAcc);
		accList.add(caAcc);
    	}
    insert accList;
    
    Contact c = new Contact(lastname='Test');    
    Insert c;
        
    AddPrimaryContact apc = new AddPrimaryContact(c,'CA');
    Test.startTest();        
        System.enqueueJob(apc);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, [select count() from Contact where Account.BillingState= 'CA']);
    
    } 
}