@isTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
	static testmethod void testScheduledJob() {
          
    //create 200 leads
    List<Lead> leadList = new List<Lead>();
        for(integer i=0;i<200;i++){
            Lead l = new Lead(lastname='test'+i, Company='test'+i);
            leadList.add(l);
        }
    insert leadList;
    
    Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        
        // Stopping the test will run the job synchronously
        Test.stopTest();
    
    System.assertEquals(200,[select count() from Lead where Leadsource='Dreamforce']);
}
}