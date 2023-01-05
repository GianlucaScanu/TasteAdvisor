Feature: Add a Dish

    #32) Aggiungere/Modificare piatto 
    #Come utente esercente
    #In modo da aggiungere un piatto al menu
    #Voglio aggiungere/modificare un piatto al/del mio menù
    Scenario: I want to add a dish 
    Given I am on the TasteAdvisor home page
    When I press "Sign in"
    # necessario specificare il bottone tramite id, l'id è presente solo sui bottoni sign in!
    And I follow "restaurat_signin"
    Then I should see "Oppure"
    When I fill in "Email" with "testcarlopizza@pizza.com"
    When I fill in "restaurant[password]" with "123456"
    And I press "Log in"
    Then I should see "Sei acceduto con successo"
    # Then I am on the TasteAdvisor home page
    When I press "Profilo"