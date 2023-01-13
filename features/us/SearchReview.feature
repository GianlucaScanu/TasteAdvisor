#rails cucumber features/us/*.feature

Feature: Search a dish and make a review of it

<<<<<<< HEAD
    Scenario: I want to Log in as Reviewer, searh a dish and rate it
        Given I am on the TasteAdvisor home page
        When I press "Sign in"
        And I follow "reviewer_signin"
        And I should see "Oppure"
        And I fill in "Email" with "testrec1@test.com"
        And I fill in "Password" with "123456a"
        And I press "Log in"
=======
    Scenario: I want to Log in as Reviewer
        Given I am on the TasteAdvisor home page
        When I press "Sign in"
        And I follow "reviewer_signin"
        Then I should see "Oppure"
        When I fill in "Email" with "testrec1@test.com"
        When I fill in "Password" with "123456a"
        When I press "Log in"
>>>>>>> a104c22ae8317f0d4aa17a5078dcf289cdb44edc
        Then I should see "Sei acceduto con successo"
        Given I am on the TasteAdvisor home page
        When I fill in "dish_search" with "Pizza"
        And I press "dish_btn"
        Then I should see "Pizza"
        Given I am on the Pizza page
        When I follow "Lascia recensione"
<<<<<<< HEAD
        # And show me the page
        And I select "2" from "review_rating1"
        And I select "3" from "review_rating2"
        And I select "4" from "review_rating3"
        # Test foto rec?
        And I fill in "review_description" with "Pizza molto gustosa, buono il servizio"
        And I press "Conferma"
        Then I should see "La recensione è stata creata correttamente"
        # And show me the page
=======
        Then show me the page
>>>>>>> a104c22ae8317f0d4aa17a5078dcf289cdb44edc
        
