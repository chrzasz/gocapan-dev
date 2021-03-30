public with sharing class TestObjectsHelper {
    public TestObjectsHelper() {

    }

    public List<TestObject3__c> createTestObjects(List<Account> accs) {
        Integer length = accs.size();
        List<TestObject1__c> to1 = new List<TestObject1__c>();
        List<TestObject2__c> to2 = new List<TestObject2__c>();
        List<TestObject3__c> to3 = new List<TestObject3__c>();
        for (Integer i = 0; i < length; i++) {
            to1.add(buildTestObject1(accs.get(i)));
        }
        insert to1;
        for (Integer i = 0; i < length; i++) {
            to2.add(buildTestObject2(accs.get(i), to1.get(i)));
        }
        insert to2;
        for (Integer i = 0; i < length; i++) {
            to3.add(buildTestObject3(to2.get(i)));
        }
        insert to3;
        for (Integer i = 0; i < length; i++) {
            to1.get(i).TestObject3__c = to3.get(i).Id;
        }
        update to1;

        return to3;
    }

    private TestObject1__c buildTestObject1(Account acc) {
        TestObject1__c to1 = new TestObject1__c(
            Account__c = acc.Id
        );
        return to1;
    }

    private TestObject2__c buildTestObject2(Account acc, TestObject1__c to1) {
        TestObject2__c to2 = new TestObject2__c(
            Account__c = acc.Id,
            TestObject1__c = to1.Id
        );
        return to2;
    }

    private TestObject3__c buildTestObject3(TestObject2__c to2) {
        TestObject3__c to3 = new TestObject3__c(
            TestObject2__c = to2.Id
        );
        return to3;
    }



}