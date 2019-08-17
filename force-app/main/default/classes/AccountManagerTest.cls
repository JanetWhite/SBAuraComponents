@IsTest
private class AccountManagerTest {
    @isTest static void testGetAccountById() {
        Id recordId = createTestRecords();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://yourInstance.salesforce.com/services/apexrest/Accounts/'+recordId+'/contacts/';
        request.httpMethod = 'GET';
        RestContext.request = request;
        system.debug('request = '+request);
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Acc', thisAccount.Name);
    }
    
    // Helper method
    static Id createTestRecords() {
        // Create test record
        Account accountTest = new Account(
            Name='Test Acc');
        insert accountTest;
        Contact contactTest = new Contact(
            LastName='Test Con', accountid=accountTest.Id);
        insert contactTest;
        return accountTest.Id;
    }     
}