#rails cucumber features/us/*.feature

Feature: Search a dish and make a review of it

    Scenario: I want to Log in as Reviewer
        Given I am on the TasteAdvisor home page
        When I press "Sign in"
        And I follow "reviewer_signin"
        Then I should see "Oppure"
        When I fill in "Email" with "testrec1@test.com"
        When I fill in "Password" with "123456a"
        When I press "Log in"
        Then I should see "Sei acceduto con successo"
        Given I am on the TasteAdvisor home page
        When I fill in "dish_search" with "Pizza"
        And I press "dish_btn"
        Then I should see "Pizza"
        Given I am on the Pizza page
        When I follow "Lascia recensione"
        Then show me the page
        
