Feature: I want to sign up

    Scenario: I want to sign up as a reviewer
        Given I am on the TasteAdvisor home page
        When I press "Sign up"
        # necessario specificare il bottone tramite id, l'id è presente solo sui bottoni sign in!
        And I follow "reviewer_signup" 
        Then I should see "Oppure"
        When I fill in "Username" with "test2"
        And I fill in "e-mail" with "test2@test.com"
        And I fill in "password" with "123456a"
        And I fill in "Password" with "123456a"
        And I press "Conferma"
        # Then I should see "Benvenuto! Ti sei registrato con successo"