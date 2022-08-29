public with sharing class SampleLogic {
  
    @auraEnabled(cacheable = true)
    public static List<Account> getAccounts()
    {
        List<Account> accountLst = [select Id, Name, Rating, Industry, Type from Account Limit 10];
        return accountLst;
    }
}
