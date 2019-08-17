public class AddPrimaryContact implements Queueable { 

    private List<Contact> contacts = new List<Contact>();
    private String state;
    private Contact contact;
    
    public AddPrimaryContact (Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }
    public void execute(QueueableContext context) {
         
        List<Account> Accounts = [select id from Account where BillingState=:state limit 200];
        system.debug('Accounts = ' + Accounts);
        system.debug('contact = ' + contact);
        system.debug('state = ' + state);
        for (Account acc : Accounts) {
          Contact con = contact.Clone(false, true, false, false);
            con.AccountId = acc.Id;
            system.debug('con = ' + con);
          contacts.add(con);
            system.debug('con = ' + con);
        }
        system.debug('contacts = ' + contacts);
        insert contacts;
    }
    
}