public class AccountProcessor {

    @future
    public static void countContacts(List<Id> theIds){
        
        List<Account> theAccounts = [select id, (select Id from Contacts) from Account where Id =: theIds ];
        
        for (Account a : theAccounts){
            a.Number_of_Contacts__c = a.Contacts.size();
        }
        
        update theAccounts;
    }
}