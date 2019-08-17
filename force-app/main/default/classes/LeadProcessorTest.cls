@isTest
public class LeadProcessorTest {

    @isTest
    private static void testLeads(){
        List<Lead> theLeads = new List<Lead>();
        for(integer i=0; i<200; i++){
            Lead aLead = new Lead(LastName = 'Last'+i, Company='Test');
            theLeads.add(aLead);
        }
        
        insert theLeads;
        
        Test.StartTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        
        System.assertEquals(200, [select count() from Lead where LeadSource='Dreamforce']);
        
    }
}