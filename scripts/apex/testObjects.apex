List<Account> accs = [SELECT Id FROM Account WHERE Name != 'Sample Account for Entitlements' LIMIT 1 OFFSET 10];
TestObjectsHelper toh = new TestObjectsHelper();
List<TestObject3__c> to3 = toh.createTestObjects(accs);

Integer i = 0;
for (Account acc : accs) {
   acc.TestObject3__c = to3.get(i).Id;
   i++;
}
update accs;