#rails cucumber features/us/*.feature

Feature: Search a dish and make a review of it

    Background: The Reviewer had an account, log in and it land on the homepage
        Given I am on the TasteAdvisor home page
        When I press "Sign in"
        And I follow "reviewer_signin"
        And I should see "Oppure"
        And I fill in "Email" with "testrec1@test.com"
        And I fill in "Password" with "123456a"
        And I press "Log in"
        Then I should see "Sei acceduto con successo"
        And I am on the TasteAdvisor home page

    Scenario: I want to searh a dish and rate it
        Given I am on the TasteAdvisor home page
        When I fill in "dish_search" with "Pizza"
        And I press "dish_btn"
        And I should see "Pizza"
        And I am on the Pizza page
        And I follow "Lascia recensione"
        And I select "2" from "review_rating1"
        And I select "3" from "review_rating2"
        And I select "4" from "review_rating3"
        And I fill in "review_description" with "Pizza molto gustosa, buono il servizio"
        And I press "Conferma"
        Then I should see "La recensione è stata creata correttamente"
        
