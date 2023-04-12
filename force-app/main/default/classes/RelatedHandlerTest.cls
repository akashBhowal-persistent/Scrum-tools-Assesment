@isTest
private class RelatedHandlerTest {
    static testMethod void testGetContacts() {
    // Create test data
    List<Contact> testContacts = new List<Contact>();
    for (Integer i = 0; i < 10; i++) {
    Contact c = new Contact(FirstName='Test', LastName='Contact ' + i, Phone='555-555-' + i, Email='test' + i + '@example.com');
    testContacts.add(c);
    }

    insert testContacts;



    // Call the method being tested

    List<Contact> results = RelatedHandler.getContacts(c.id);



    // Verify the results

    System.assertEquals(10, results.size(), 'Incorrect number of contacts returned');



    for (Integer i = 0; i < 10; i++) {

    Contact c = results[i];

    System.assertEquals('Test', c.FirstName);

    System.assertEquals('Contact ' + i, c.LastName);

    System.assertEquals('555-555-' + i, c.Phone);

    System.assertEquals('test' + i + '@example.com', c.Email);

    }

    }



    static testMethod void testDeleteContacts() {

    // Create test data

    List<Contact> testContacts = new List<Contact>();

    for (Integer i = 0; i < 5; i++) {

    Contact c = new Contact(FirstName='Test', LastName='Contact ' + i, Phone='555-555-' + i, Email='test' + i + '@example.com');

    testContacts.add(c);

    }

    insert testContacts;



    // Call the method being tested

    List<Id> idsToDelete = new List<Id>();

    for (Contact c : testContacts) {

    idsToDelete.add(c.Id);

    }

    RelatedHandler.deleteContacts(idsToDelete);



    // Verify the results

    List<Contact> remainingContacts = [SELECT Id FROM Contact];
    System.assertEquals(0, remainingContacts.size(), 'Contacts were not deleted');
    }

}