global class LeadProcessor implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc)  {
        // collect the batches of records or objects to be passed to 
        return Database.getQueryLocator('select Id from Lead');
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        for(Lead le : scope){
            le.LeadSource = 'Dreamforce';
        }
        update scope;
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    
}