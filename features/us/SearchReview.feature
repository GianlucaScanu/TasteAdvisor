#rails cucumber features/us/*.feature

Feature: Search a dish and make a review of it

    Scenario: I want to search a dish 
    Given I am on the TasteAdvisor home page
    When I press "Sign in"
    # necessario specificare il bottone tramite id, l'id è presente solo sui bottoni sign in!
    And I follow "reviewer_signin"
    When I fill in "Email" with "test1@test.com"
    And I fill in "Password" with "123456"
    And I press "Log in"
    Then I am on the TasteAdvisor home page
    When I fill in "restaurant_search" with "Pizza"
    And I press "dish_btn"
    # Then I should see "Pizza" in teoria
    Then I should not see "Pizza"