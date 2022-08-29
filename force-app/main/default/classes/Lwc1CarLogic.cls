public with sharing class Lwc1CarLogic {
   
    @auraEnabled(cacheable = true)
    public static List<Car_Type__c> getCarTypes()
    {
        List<Car_Type__c> carTypesLst = new List<Car_Type__c>();
        carTypesLst = [select Id, Name from Car_Type__c];
        return carTypesLst;
    }

    @auraEnabled
    public static List<Car__c> getCars(String type)
    {
        List<Car__c> carLst = new List<Car__c>();
        if(type != null && type != '')
        {
            carLst = [select Id, Name, Build_Year__c, Car_Type__c,Contact__c, Location__c, Milage__c, 
                      Picture__c, Rent_Per_Day__c, Contact__r.FirstName, Contact__r.LastName
                      from Car__c where Car_Type__c =: type];
        }
        else {
            
            carLst = [select Id, Name, Build_Year__c, Car_Type__c,Contact__c, Location__c, Milage__c, 
                      Picture__c, Rent_Per_Day__c, Contact__r.FirstName, Contact__r.LastName
                      from Car__c];
        }
        
        return carLst;
        
    }

    @auraEnabled(cacheable=true)
    public static List<Car_Experience__c> getExp(String carId)
    {
        List<Car_Experience__c> expLst = [select Id, title__c, Name, Car__c, Description__c, createdDate,
                                          owner.FirstName, owner.LastName
                                          from Car_Experience__c
                                          where Car__c =:carId ];
        return expLst;
    }


    
}
