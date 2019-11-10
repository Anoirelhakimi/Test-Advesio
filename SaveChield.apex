public class SaveChield {

    
    
    
    
    @AuraEnabled
    public static void saveContact ( Contact contact, list<enfant__c> enfants) {
          Contact NewContact = new Contact (FirstName=contact.FirstName, LastName=contact.LastName,Title=contact.Title, Email=contact.Email);
          System.debug('Contact is '+NewContact);
        
        try{
            insert NewContact;
            Id idcontact=NewContact.Id; 
            List<enfant__c> enfs= new List<enfant__c>();
            for(enfant__c enf : enfants){
                integer i=0;
                enfant__c enfant=new enfant__c();
                enfant.Pere__c =idcontact;
                enfant.Nom__c = enf.Nom__c;
                enfant.prenom__c =enf.prenom__c;
                enfant.Age__c =enf.Age__c;
                enfs.add(enfant);
                i++;
            }
            
            if(!enfs.isEmpty()){
                System.debug('OKKK');
                try{
                  insert enfs;  
                }catch(Exception E){
            	System.debug(E.getMessage());
        }
            }
        }catch(Exception E){
            System.debug(E.getMessage());
        }
        
        }
    
}
