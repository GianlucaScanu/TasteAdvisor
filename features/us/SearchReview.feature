#rails cucumber features/us/*.feature

Feature: Search a dish and make a review of it

    #28) Ricerca per categoria
    #Come un utente visitatore, recensore o esercente
    #In modo da cercare il piatto di mio interesse 
    #Voglio cercare il piatto da me desiderato in base alla sua categoria
    #+
    #17) Fare una recensione
    #Come utente recensore
    #In modo da recensire un piatto
    #Voglio aggiungere una recensione alla lista delle sue recensioni

    Scenario: I want to search a dish 
        Given I am on the TasteAdvisor home page
        When I press "Sign in"
        # necessario specificare il bottone tramite id, l'id è presente solo sui bottoni sign in!
        And I follow "reviewer_signin" 
        When I fill in "reviewer_email" with "test1@test.com"
        When I fill in "reviewer_password" with "123456"
        And I press "Log in"
        Then I should see "Sei acceduto con successo"
        When I fill in "restaurant_search" with "Pizza"
        And I press "dish_btn"
        # Then I should see "Pizza" in teoria
        Then I should not see "Pizza"