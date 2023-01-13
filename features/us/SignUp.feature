Feature: I want to sign up

    Scenario: I want to sign up as a reviewer
        Given I am on the TasteAdvisor home page
        When I press "Sign up"
        And I follow "reviewer_signup" 
        And I should see "Oppure"
        And I fill in "reviewer_username" with "test2"
        And I fill in "reviewer_email" with "test2@test.com"
        And I fill in "reviewer_password" with "123456a"
        And I fill in "reviewer_password_confirmation" with "123456a"
        Then I press "Conferma"
        #Then show me the page
        #And I should see "Benvenuto! Ti sei registrato con successo"
