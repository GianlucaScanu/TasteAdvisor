Feature: Add a Dish

    Scenario: I want to add a dish 
    Given I am on the TasteAdvisor home page
    When I press "Sign in"
    # necessario specificare il bottone tramite id, l'id è presente solo sui bottoni sign in!
    And I follow "restaurat_signin"
    When I fill in "Email" with "testcarlopizza@pizza.com"
    And I fill in "Password" with "123456"
    And I press "Log in"
    Then I am on the TasteAdvisor home page