@RestResource(urlMapping='/Accounts/<Account_ID>/contacts/*')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        system.debug('accountId = '+accountId);
        Account result =  [SELECT Id, Name, 
                           (SELECT Id, Name FROM Contacts)
                        FROM Account
                        WHERE Id = :accountId];
        return result;
    }
}