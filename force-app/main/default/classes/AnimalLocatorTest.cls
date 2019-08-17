@isTest
private class AnimalLocatorTest {
     @isTest static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String name = AnimalLocator.getAnimalNameById(1);
        
        // Verify response received contains fake values
        System.assertEquals('chicken', name);
    }
}